vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.autoindent = true
vim.opt.smartindent = true

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = 'C:/nvim/undodir'
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = 'yes'
vim.opt.isfname:append '@-@'

vim.opt.updatetime = 50

-- vim.opt.colorcolumn = "80"

vim.g.mapleader = ' '

vim.api.nvim_create_augroup('setIndent', { clear = true })
vim.api.nvim_create_autocmd('FileType', {
  group = 'setIndent',
  pattern = { 'javascript', 'typescript', 'xml', 'html', 'xhtml', 'css', 'scss', 'yaml', 'toml', 'json', 'lua' },
  command = 'setlocal shiftwidth=2 tabstop=2',
})

vim.cmd.colorscheme 'tokyonight'

vim.opt.guifont = { 'JetBrainsMonoNL Nerd Font Mono', ':h11' }
