vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  use {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.1',
    requires = { { 'nvim-lua/plenary.nvim' } },
  }

  use 'folke/tokyonight.nvim'
  use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })
  use 'nvim-treesitter/nvim-treesitter-context'

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

  use {
    'folke/trouble.nvim',
    requires = 'nvim-tree/nvim-web-devicons',
    config = function()
      require('trouble').setup {}
    end,
  }

  use { 'akinsho/bufferline.nvim', tag = 'v3.*', requires = 'nvim-tree/nvim-web-devicons' }
  use { 'romgrk/barbar.nvim', requires = 'nvim-web-devicons' }

  use 'numToStr/Comment.nvim'
  use {
    'windwp/nvim-autopairs',
    config = function()
      require('nvim-autopairs').setup {}
    end,
  }

  --   'j-hui/fidget.nvim',
  --   config = function()
  --     require('fidget').setup {}
  --   end,
  -- }

  use {
    'lukas-reineke/indent-blankline.nvim',
    config = function()
      require('indent_blankline').setup {
        show_current_context = true,
        show_current_context_start = false,
        -- char = "▎",
        -- char = "┊",
        char = '¦',
      }
    end,
  }

  -- use 'lambdalisue/fern.vim'
  use {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup()
    end,
  }
  use 'jose-elias-alvarez/null-ls.nvim'
  use 'MunifTanjim/prettier.nvim'
  use 'b0o/schemastore.nvim'
  use {
    'kylechui/nvim-surround',
    tag = '*',
    config = function()
      require('nvim-surround').setup {}
    end,
  }
  use 'arkav/lualine-lsp-progress'

  use {
    'folke/todo-comments.nvim',
    requires = 'nvim-lua/plenary.nvim',
    config = function()
      require('todo-comments').setup { signs = false }
    end,
  }

  use 'NvChad/nvim-colorizer.lua'

  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons', -- optional, for file icons
    },
    tag = 'nightly', -- optional, updated every week. (see issue #1193)
  }

  use { 'catppuccin/nvim', as = 'catppuccin' }

  use 'ThePrimeagen/vim-be-good'

  use {
    'smjonas/inc-rename.nvim',
    config = function()
      require('inc_rename').setup()
    end,
  }

  use 'onsails/lspkind.nvim'
  use 'windwp/nvim-ts-autotag'

  use {
    'L3MON4D3/LuaSnip',
    -- follow latest release.
    tag = 'v<CurrentMajor>.*',
    -- install jsregexp (optional!:).
    run = 'make install_jsregexp',
  }
end)
