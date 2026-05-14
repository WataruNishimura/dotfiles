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
        "lua_ls"
      }
    },
    dependencies = {
        { "mason-org/mason.nvim", opts = {} },
        "neovim/nvim-lspconfig",
    },
  }
}
