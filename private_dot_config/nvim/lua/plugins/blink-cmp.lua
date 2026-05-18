return {
  "saghen/blink.cmp",
  version = "*",
  opts = {
    sources = { default = { "lsp", "path", "snippets", "buffer" } },
    completion = {
      list = { selection = { preselect = false, auto_insert = true } },
    },
  },
}
