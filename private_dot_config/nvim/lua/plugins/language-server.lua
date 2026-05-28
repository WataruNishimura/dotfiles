return {
  'neovim/nvim-lspconfig',
  {
    'williamboman/mason.nvim',
    opts = {}
  },
  {
    "mason-org/mason-lspconfig.nvim",
    opts = {
      automatic_enable = true,
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
      vim.lsp.config("vtsls", {
        filetypes = {
          "javascript", "javascriptreact", "javascript.jsx",
          "typescript", "typescriptreact", "typescript.tsx",
          "vue",
        },
      })
    end,
  }
}
