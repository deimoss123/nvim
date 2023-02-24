require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'auto',
    -- component_separators = { left = '', right = ''},
    component_separators = '┋',
    section_separators = { left = '', right = '' },
    -- section_separators = { left = '', right = '' },
    -- section_separators = "",
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = true,
    refresh = {
      statusline = 100,
      tabline = 100,
      winbar = 100,
    },
    padding = 2,
    filetype_names = {
      TelescopePrompt = 'Telescope',
      dashboard = 'Dashboard',
      packer = 'Packer',
      fzf = 'FZF',
      alpha = 'Alpha',
    },
  },
  sections = {
    lualine_a = { 'mode' },
    lualine_b = {
      'branch',
      {
        'diff',
        diff_color = {
          -- Same color values as the general color option can be used here.
          -- added    = 'DiffAdd', -- Changes the diff's added color
          -- modified = 'DiffChange', -- Changes the diff's modified color
          -- removed  = 'DiffDelete', -- Changes the diff's removed color you
        },
      },
      'diagnostics',
    },
    lualine_c = {
      {
        'filename',
        path = 1,
      },
      'filesize',
    },
    lualine_x = {
      {
        'lsp_progress',
        separators = {
          component = ' ',
          progress = ' | ',
          message = { pre = '(', post = ')', commenced = 'In Progress', completed = 'Completed' },
          percentage = { pre = '', post = '%% ' },
          title = { pre = '', post = ': ' },
          lsp_client_name = { pre = '[', post = ']' },
          spinner = { pre = '', post = '' },
        },
        display_components = { 'lsp_client_name', 'spinner', { 'title', 'percentage', 'message' } },
        timer = { progress_enddelay = 500, spinner = 1000, lsp_client_name_enddelay = 1000 },
        spinner_symbols = { '⠋', '⠙', '⠚', '⠒', '⠂', '⠂', '⠒', '⠲', '⠴', '⠦', '⠖', '⠒', '⠐', '⠐', '⠒', '⠓', '⠋' },
      },
    },
    lualine_y = { 'encoding', 'filetype' },
    lualine_z = { 'location' },
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { 'filename' },
    lualine_x = { 'location' },
    lualine_y = {},
    lualine_z = {},
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {},
}
