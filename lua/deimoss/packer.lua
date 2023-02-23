return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  use {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.1',
    requires = { { 'nvim-lua/plenary.nvim' } },
  }

  use 'folke/tokyonight.nvim'
  use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })
  use 'theprimeagen/harpoon'
  use 'mbbill/undotree'
  use 'tpope/vim-fugitive'
  use 'nvim-tree/nvim-web-devicons'

  use {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v1.x',
    requires = {
      -- LSP Support
      { 'neovim/nvim-lspconfig' }, -- Required
      { 'williamboman/mason.nvim' }, -- Optional
      { 'williamboman/mason-lspconfig.nvim' }, -- Optional

      -- Autocompletion
      { 'hrsh7th/nvim-cmp' }, -- Required
      { 'hrsh7th/cmp-nvim-lsp' }, -- Required
      { 'hrsh7th/cmp-buffer' }, -- Optional
      { 'hrsh7th/cmp-path' }, -- Optional
      { 'saadparwaiz1/cmp_luasnip' }, -- Optional
      { 'hrsh7th/cmp-nvim-lua' }, -- Optional

      -- Snippets
      { 'L3MON4D3/LuaSnip' }, -- Required
      { 'rafamadriz/friendly-snippets' }, -- Optional
    },
  }

  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true },
  }

  -- use {
  --     "folke/trouble.nvim",
  --     requires = "nvim-tree/nvim-web-devicons",
  --     config = function()
  --         require("trouble").setup {
  --             -- your configuration comes here
  --             -- or leave it empty to use the default settings
  --             -- refer to the configuration section below
  --         }
  --     end
  -- }

  use { 'romgrk/barbar.nvim', requires = 'nvim-web-devicons' }
  use { 'akinsho/toggleterm.nvim', tag = '*', opts = {} }
  use 'numToStr/Comment.nvim'
  use { 'windwp/nvim-autopairs', opts = {} }
  use { 'j-hui/fidget.nvim', opts = {} }

  use {
    'lukas-reineke/indent-blankline.nvim',
    opts = {
      show_current_context = true,
      show_current_context_start = false,
      -- char = "▎",
      -- char = "┊",
      char = '¦',
    },
  }

  use 'lambdalisue/fern.vim'
  use { 'lewis6991/gitsigns.nvim', opts = {} }
  use 'jose-elias-alvarez/null-ls.nvim'
  use 'b0o/schemastore.nvim'
end)
