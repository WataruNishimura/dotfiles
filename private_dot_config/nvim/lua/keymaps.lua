vim.g.mapleader = ' '

local opts = { noremap = true, silent = true }

--local keymap = vim.keymap
local keymap = vim.api.nvim_set_keymap

--Map Ctrl-C to Esc
keymap("n", "<C-c>", "Esc", opts)

vim.keymap.set('n', '<leader>e', '<Cmd>Neotree toggle<CR>')

-- Escでターミナルモードから抜ける
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>')
vim.keymap.set('t', '<M-c>', '<C-\\><C-n>')

-- ショートカットでターミナルを開く
vim.keymap.set('n', '<leader>t', ':split | terminal<CR>')

vim.keymap.set('n', '<leader>j', vim.diagnostic.open_float)


-- telescopeの設定 --
vim.keymap.set('n', '<leader>ff', function() require('telescope.builtin').find_files() end, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>lg', function() require('telescope.builtin').live_grep() end, { desc = 'Telescope find files' })

-- language server protocol, 定義ジャンプ --
vim.keymap.set('n', 'gd', '<cmd>:lua vim.lsp.buf.definition()<CR>')
vim.keymap.set('n', 'gD', '<cmd>:lua vim.lsp.buf.declaration()<CR>')

-- importの一括追加スクリプト --
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local bufnr = args.buf
    local client = vim.lsp.get_client_by_id(args.data.client_id)

    -- すべての未 import を一括追加
    vim.keymap.set("n", "<leader>oi", function()
      vim.lsp.buf.code_action({
        apply = true,
        context = {
          only = { "source.addMissingImports.ts" },
          diagnostics = {},
        },
      })
    end, { buffer = bufnr, desc = "Add missing imports" })

    -- 未使用 import を削除
    vim.keymap.set("n", "<leader>ru", function()
      vim.lsp.buf.code_action({
        apply = true,
        context = {
          only = { "source.removeUnused.ts" },
          diagnostics = {},
        },
      })
    end, { buffer = bufnr, desc = "Remove unused" })

    -- import の並び替え
    vim.keymap.set("n", "<leader>oo", function()
      vim.lsp.buf.code_action({
        apply = true,
        context = {
          only = { "source.organizeImports" },
          diagnostics = {},
        },
      })
    end, { buffer = bufnr, desc = "Organize imports" })
  end,
})
