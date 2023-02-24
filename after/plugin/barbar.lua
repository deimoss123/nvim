-- local bufferline_api = require 'bufferline.api'
-- bufferline_api.set_offset(31)

require('bufferline').setup {
  separator_style = "slant",
  closable = false,
  icon_separator_active = '▎',
  icon_separator_inactive = '▎',
  icon_close_tab = '',
  icon_close_tab_modified = '●',
  icon_pinned = '車',
  letters = 'asdfjkl;ghnmxcvbziowerutyqpASDFJKLGHNMXCVBZIOWERUTYQP',
}
