-- Flow language server (https://flow.org/).
-- The base config is provided by nvim-lspconfig's lsp/flow.lua and is merged
-- with this table. By default it:
--   * runs `flow lsp` if `flow` is on PATH, otherwise `npx --no-install flow lsp`
--     (i.e. the project-local flow-bin), and
--   * only attaches when a `.flowconfig` is present at the project root.
-- We also attach when a `flow-typed.config.json` exists. root_markers is
-- listed explicitly because list values replace (not append to) the base
-- config when merged.
return {
  root_markers = { ".flowconfig", "flow-typed.config.json" },
}
