local detect = require('utils.detect')

local js_formatter = function(bufnr) 
  if detect.has_prettier_config(bufnr) then
    return { "prettier" }
  end
  return { "oxfmt" }
end

return {
  "stevearc/conform.nvim",
  event = {
    "BufReadPre", "BufNewFile"
  },
  config = function()
    require("conform").setup({
      formatters_by_ft = {
        javascript = js_formatter,
        javscriptreact = js_formatter,
        typescript = js_formatter,
        typescriptreact = js_formatter,
        vue = js_formatter,
        python = { "ruff_format" }
      }
    })
  end
}
