-- basedpyright (https://docs.basedpyright.com/).
-- Owns type checking, completion, go-to-definition, and hover for Python.
-- The base config is provided by nvim-lspconfig's lsp/basedpyright.lua and is
-- merged with this table.
--
-- Ruff owns linting, formatting, and import organizing, so we disable
-- basedpyright's overlapping import organizer and keep it focused on types.
return {
  settings = {
    basedpyright = {
      disableOrganizeImports = true,
      analysis = {
        -- Only diagnose open files (workspace-wide is noisy on large repos).
        diagnosticMode = "openFilesOnly",
        -- "standard" is a balanced default; bump to "strict" per project via
        -- a pyrightconfig.json / pyproject.toml if you want tighter checks.
        typeCheckingMode = "standard",
        autoImportCompletions = true,
        useLibraryCodeForTypes = true,
      },
    },
  },
}
