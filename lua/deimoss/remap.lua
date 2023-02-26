vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- go to netrw
-- map('n', '<leader>e', '<cmd>Lex 30<cr>', opts)
map('n', '<leader>e', '<cmd>NvimTreeFindFileToggle<cr>', opts)

-- ctrl + s = save obviously
map({ 'n', 'i' }, '<C-s>', '<cmd>w!<cr>')

-- toggle terminal
map('n', '<leader>t', '<cmd>TroubleToggle<cr>zz')
map('n', '<leader>u', vim.cmd.UndotreeToggle)

-- move selection (very cool remap)
map('v', 'J', ":m '>+1<CR>gv=gv", opts)
map('v', 'K', ":m '<-2<CR>gv=gv", opts)

-- dont move cursor when doing J
map('n', 'J', 'mzJ`z', opts)

-- keep cursor in the center of screen
map('n', '<C-d>', '<C-d>zz', opts)
map('n', '<C-u>', '<C-u>zz', opts)
map('n', 'n', 'nzzzv', opts)
map('n', 'N', 'Nzzzv', opts)

-- paste into void buffer
map('v', 'p', '"_dP', opts)

-- copy to system clipboard
map('n', '<leader>y', '"+y', opts)
map('v', '<leader>y', '"+y', opts)
map('n', '<leader>Y', '"+Y', opts)

-- delete into void buffer
map('n', '<leader>d', '"_d', opts)
map('v', '<leader>d', '"_d', opts)

-- stay in visual mode when indenting
map('v', '>', '>gv', opts)
map('v', '<', '<gv', opts)

-- escape terminal
map('t', '<Esc>', '<C-\\><C-n>', opts)

-- for navigating buffers
map('n', '<A-,>', '<Cmd>BufferPrevious<CR>', opts)
map('n', '<A-.>', '<Cmd>BufferNext<CR>', opts)

map('n', '<A-<>', '<Cmd>BufferMovePrevious<CR>', opts)
map('n', '<A->>', '<Cmd>BufferMoveNext<CR>', opts)

map('n', '<A-1>', '<Cmd>BufferGoto 1<CR>', opts)
map('n', '<A-2>', '<Cmd>BufferGoto 2<CR>', opts)
map('n', '<A-3>', '<Cmd>BufferGoto 3<CR>', opts)
map('n', '<A-4>', '<Cmd>BufferGoto 4<CR>', opts)
map('n', '<A-5>', '<Cmd>BufferGoto 5<CR>', opts)
map('n', '<A-6>', '<Cmd>BufferGoto 6<CR>', opts)
map('n', '<A-7>', '<Cmd>BufferGoto 7<CR>', opts)
map('n', '<A-8>', '<Cmd>BufferGoto 8<CR>', opts)
map('n', '<A-9>', '<Cmd>BufferGoto 9<CR>', opts)
map('n', '<A-0>', '<Cmd>BufferLast<CR>', opts)

map('n', '<A-p>', '<Cmd>BufferPin<CR>', opts)
map('n', '<A-c>', '<Cmd>BufferClose<CR>', opts)
