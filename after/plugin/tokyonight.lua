require('tokyonight').setup {
  -- your configuration comes here
  -- or leave it empty to use the default settings
  style = 'storm', -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
  light_style = 'day', -- The theme is used when the background is set to light
  transparent = false, -- Enable this to disable setting the background color
  terminal_colors = false, -- Configure the colors used when opening a `:terminal` in Neovim
  styles = {
    -- Style to be applied to different syntax groups
    -- Value is any valid attr-list value for `:help nvim_set_hl`
    comments = { italic = false },
    keywords = { italic = false },
    functions = {},
    variables = {},
    -- Background styles. Can be "dark", "transparent" or "normal"
    sidebars = 'moon', -- style for sidebars, see below
    floats = 'dark', -- style for floating windows
  },
  sidebars = { 'qf', 'help', 'NvimTree' }, -- Set a darker background on sidebar-like windows. For example: `["qf", "vista_kind", "terminal", "packer"]`
  day_brightness = 0.3, -- Adjusts the brightness of the colors of the **Day** style. Number between 0 and 1, from dull to vibrant colors
  hide_inactive_statusline = true, -- Enabling this option, will hide inactive statuslines and replace them with a thin border instead. Should work with the standard **StatusLine** and **LuaLine**.
  dim_inactive = false, -- dims inactive windows
  lualine_bold = true, -- When `true`, section headers in the lualine theme will be bold

  on_colors = function(c)
    c.gitSigns = {
      add = c.green,
      change = c.cyan,
      delete = c.red1,
    }
    c.git = {
      add = c.green,
      change = c.cyan,
      delete = c.red1,
    }
  end,
  --
  -- https://github.com/folke/tokyonight.nvim/blob/main/lua/tokyonight/colors.lua
  on_highlights = function(hl, c)
    local prompt = '#2d3149'
    hl.TelescopeNormal = {
      bg = c.bg_dark,
      fg = c.white,
    }
    hl.TelescopeBorder = {
      bg = c.bg_dark,
      fg = c.bg_dark,
    }
    hl.TelescopePromptNormal = {
      bg = prompt,
    }
    hl.TelescopePromptBorder = {
      bg = prompt,
      fg = prompt,
    }
    hl.TelescopePromptTitle = {
      bg = prompt,
      fg = prompt,
    }
    hl.TelescopePreviewTitle = {
      bg = c.bg_dark,
      fg = c.bg_dark,
    }
    hl.TelescopeResultsTitle = {
      bg = c.bg_dark,
      fg = c.white,
    }
    hl.CmpItemAbbrMatch = {
      fg = c.red,
    }
    hl.CmpItemAbbrMatchFuzzy = {
      fg = c.red,
    }
    hl.IndentBlanklineContextChar = {
      fg = c.fg_dark,
    }
    hl.CmpBorder = {
      fg = c.fg_gutter,
    }
    hl.CmpDocBorder = {
      fg = c.fg_gutter,
    }
    hl.CmpPmenu = {
      bg = c.bg,
    }
  end,
}

local _ = {
  none = 'NONE',
  bg_dark = '#1f2335',
  bg = '#24283b',
  bg_highlight = '#292e42',
  terminal_black = '#414868',
  fg = '#c0caf5',
  fg_dark = '#a9b1d6',
  fg_gutter = '#3b4261',
  dark3 = '#545c7e',
  comment = '#565f89',
  dark5 = '#737aa2',
  blue0 = '#3d59a1',
  blue = '#7aa2f7',
  cyan = '#7dcfff',
  blue1 = '#2ac3de',
  blue2 = '#0db9d7',
  blue5 = '#89ddff',
  blue6 = '#b4f9f8',
  blue7 = '#394b70',
  magenta = '#bb9af7',
  magenta2 = '#ff007c',
  purple = '#9d7cd8',
  orange = '#ff9e64',
  yellow = '#e0af68',
  green = '#9ece6a',
  green1 = '#73daca',
  green2 = '#41a6b5',
  teal = '#1abc9c',
  red = '#f7768e',
  red1 = '#db4b4b',
  git = { change = '#6183bb', add = '#449dab', delete = '#914c54' },
  gitSigns = {
    add = '#266d6a',
    change = '#536c9e',
    delete = '#b2555b',
  },
}

vim.cmd.colorscheme 'tokyonight'
