require 'user.remap'
require 'user.packer'
require 'user.set'

-- vim.cmd.colorscheme 'tokyonight'
-- vim.cmd.colorscheme 'catppuccin'

-- disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- open nvim tree on startup
vim.api.nvim_create_autocmd({ 'VimEnter' }, {
  callback = function()
    require('nvim-tree.api').tree.open()
    vim.cmd [[hi NvimTreeNormal guibg=NONE ctermbg=NONE]]
  end,
})

vim.api.nvim_create_autocmd('TextYankPost', {
  group = vim.api.nvim_create_augroup('highlight_yank', {}),
  desc = 'Hightlight selection on yank',
  pattern = '*',
  callback = function()
    vim.highlight.on_yank { higroup = 'IncSearch', timeout = 150 }
  end,
})
