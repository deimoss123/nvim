require 'deimoss.remap'
require 'deimoss.packer'
require 'deimoss.set'

-- vim.cmd.colorscheme 'tokyonight'
vim.cmd.colorscheme 'catppuccin'

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
-- vim.g.netrw_banner = 0
-- vim.g.netrw_bufsettings = 'noma nomod nonu nowrap ro buflisted'

vim.api.nvim_create_autocmd({ 'VimEnter' }, {
  callback = function()
    require('nvim-tree.api').tree.open()
    vim.cmd [[hi NvimTreeNormal guibg=NONE ctermbg=NONE]]
  end,
})
