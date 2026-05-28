local vue_language_server_path = vim.fn.stdpath('data')
  .. '/mason/packages/vue-language-server/node_modules/@vue/language-server'

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
      tsserver = {
        globalPlugins = {
          {
            name = "@vue/typescript-plugin",
            location = vue_language_server_path,
            languages = { "vue" },
            configNamespace = "typescript",
          },
        },
      },
      experimental = {
        completion = {
          enableServerSideFuzzyMatch = true
        }
      }
    }
  }
}
