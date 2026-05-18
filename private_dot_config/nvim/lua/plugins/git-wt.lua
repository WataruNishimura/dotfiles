return {
  "WataruNishimura/git-wt.nvim",
  dependencies = { "nvim-telescope/telescope.nvim" }, -- optional
  config = function()
    require("git-wt").setup()
  end,
}
