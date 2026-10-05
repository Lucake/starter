require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

vim.keymap.set('n', '<leader>[', '<Cmd>Neotree toggle<Cr>')
vim.keymap.set('n', '<leader>]', '<Cmd>Neotree float reveal<Cr>')
vim.keymap.set({ 'n', 'x', 'i', 's' }, '<C-s>', '<Cmd>w<Cr>')

-- Buffer Navigation
vim.keymap.set('n', '<Alt>]', '<Cmd>bnext<CR>', { noremap = true, silent = true, desc = 'Buffer: Next' })
vim.keymap.set('n', '<Alt>[', '<Cmd>bprevious<CR>', { noremap = true, silent = true, desc = 'Buffer: Previous' })


--move row
vim.keymap.set('n', '<A-down>', 'ddp', { noremap = true, silent = true, desc = 'Buffer: Previous' })
vim.keymap.set('n', '<A-Up>', 'dd<Up><S-p>', { noremap = true, silent = true, desc = 'Buffer: Previous' })
vim.keymap.set('n', '<A-y>', 'yyp', { noremap = true, silent = true, desc = 'Buffer: Previous' })

vim.keymap.set('n', '<C-S-a>', 'gg0vG$', { noremap = true, silent = true, desc = 'Select all text' })

local builtin = require 'telescope.builtin'
vim.keymap.set('n', '<leader><leader>', builtin.buffers, { desc = '[ ] Find existing buffers' })

map('n', '<F5>', '<Cmd>Run<Cr>')
