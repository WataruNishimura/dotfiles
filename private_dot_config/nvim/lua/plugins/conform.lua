local detect = require('utils.detect')

local js_formatter = function(bufnr) 
  if detect.has_oxlint_config(bufnr) then
    return { "oxfmt" }
  end
  if detect.has_prettier_config(bufnr) then
    return { "prettier" }
  end
  return {}
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
      }
    })
  end
}
