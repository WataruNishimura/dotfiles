-- nvim-treesitter on the `main` branch (the rewrite).
--
-- The legacy `master` branch is frozen and its custom query predicates break on
-- Neovim 0.12+ (they crash while parsing markdown injections, which is what
-- render-markdown.nvim triggers). `main` supports current Neovim, so we pin to
-- it here. lazy.nvim merges this spec with the dependency reference declared in
-- render-markdown.lua.
--
-- On `main` there is no `highlight.enable` option: parsers are installed via
-- `install()` and highlighting is started per-buffer with `vim.treesitter.start`.
return {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
  lazy = false,
  build = ":TSUpdate",
  config = function()
    local langs = {
      "markdown", "markdown_inline", -- required by render-markdown.nvim
      "lua", "vim", "vimdoc", "bash", "python",
      "javascript", "typescript", "tsx", "vue",
      "json", "yaml", "toml", "html", "css",
    }
    require("nvim-treesitter").install(langs)

    -- Start treesitter highlighting for buffers whose parser is installed.
    -- pcall swallows filetypes without a parser instead of erroring.
    vim.api.nvim_create_autocmd("FileType", {
      callback = function(args)
        pcall(vim.treesitter.start, args.buf)
      end,
    })
  end,
}
