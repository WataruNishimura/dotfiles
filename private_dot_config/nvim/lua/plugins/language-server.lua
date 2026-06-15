return {
  'neovim/nvim-lspconfig',
  {
    'williamboman/mason.nvim',
    opts = {}
  },
  {
    "mason-org/mason-lspconfig.nvim",
    opts = {
      -- Auto-enable installed servers, but NOT tsgo (TypeScript native preview):
      -- vtsls is our TypeScript server, and running both conflicts.
      automatic_enable = {
        exclude = { "tsgo" },
      },
      ensure_installed = {
        "vtsls",
        "eslint",
        "lua_ls",
        "vue_ls"
      }
    },
    dependencies = {
        { "mason-org/mason.nvim", opts = { }},
        "neovim/nvim-lspconfig",
    },
    config = function(_, opts)
      require("mason-lspconfig").setup(opts)

      -- Markers that identify a Flow project; the flow LSP owns these files.
      local flow_markers = { ".flowconfig", "flow-typed.config.json" }

      -- Wrap vtsls' default root_dir so it does NOT attach inside Flow projects
      -- (keeps the built-in deno/monorepo detection intact).
      local vtsls_root_dir = vim.lsp.config.vtsls.root_dir
      vim.lsp.config("vtsls", {
        filetypes = {
          "javascript", "javascriptreact", "javascript.jsx",
          "typescript", "typescriptreact", "typescript.tsx",
          "vue",
        },
        root_dir = function(bufnr, on_dir)
          if vim.fs.root(bufnr, flow_markers) then
            return -- Flow project: let the flow LSP handle it
          end
          if vtsls_root_dir then
            vtsls_root_dir(bufnr, on_dir)
          else
            on_dir(vim.fs.root(bufnr, { "package.json", ".git" }) or vim.fn.getcwd())
          end
        end,
      })

      -- flow is project-local (flow-bin via npx), not a mason server,
      -- so enable it explicitly. It only attaches when a flow marker exists.
      vim.lsp.enable("flow")
    end,
  }
}
