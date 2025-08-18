local opts = { noremap = true, silent = true }
local term_opts = { silent = true }

--local keymap = vim.keymap
local keymap = vim.api.nvim_set_keymap

--Map Ctrl-C to Esc
keymap("n", "<C-c>", "Esc", opts)

