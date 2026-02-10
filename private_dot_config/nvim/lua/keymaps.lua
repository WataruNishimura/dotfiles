vim.g.mapleader = ' '

local opts = { noremap = true, silent = true }

--local keymap = vim.keymap
local keymap = vim.api.nvim_set_keymap

--Map Ctrl-C to Esc
keymap("n", "<C-c>", "Esc", opts)

vim.keymap.set('n', '<leader>e', '<Cmd>Neotree toggle<CR>')

-- Escでターミナルモードから抜ける
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>')

-- ショートカットでターミナルを開く
vim.keymap.set('n', '<leader>t', ':split | terminal<CR>')

vim.keymap.set('n', '<leader>j', vim.diagnostic.open_float)
