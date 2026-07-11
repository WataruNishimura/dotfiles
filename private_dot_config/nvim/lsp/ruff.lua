-- Ruff language server (https://docs.astral.sh/ruff/editors/).
-- Provides linting, quick-fix code actions, and import organizing for Python.
-- Formatting is handled by conform.nvim (ruff_format), not here.
-- The base config is provided by nvim-lspconfig's lsp/ruff.lua and is merged
-- with this table.
--
-- basedpyright provides richer hover (type info), so silence ruff's hover to
-- avoid duplicate popups.
return {
  on_attach = function(client, _)
    client.server_capabilities.hoverProvider = false
  end,
}
