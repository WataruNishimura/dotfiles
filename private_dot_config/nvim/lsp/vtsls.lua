return {
  settings = {
    typescript = {
      preferences = {
        includeCompletionsForModuleExports = true,
        includeCompletionsForImportsStatements = true,
        importModulesSpecifier = "relative"
      },
      updateImportsOnFileMove = { enabled = "always" },
      suggest = {
        completeFunctionCalls = true,
        autoImports = true
      }
    },
    javascript = {
      preferences = {
        includeCompletionsForModuleExports = true,
        includeCompletionsForImportsStatements = true,
      },
      updateImportsOnFileMove = { enabled = "always" }
    },
    vtsls = {
      experimental = {
        completion = {
          enableServerSideFuzzyMatch = true
        }
      }
    }
  }
}
