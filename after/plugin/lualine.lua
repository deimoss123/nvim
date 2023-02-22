require('lualine').setup {
    options = {
        icons_enabled = true,
        theme = 'auto',
        -- component_separators = { left = '', right = ''},
        component_separators = "┋",
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
            alpha = 'Alpha'
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
            'diagnostics' },
        lualine_c = {
            {
                'filename',
                path = 1
            }
        },
        lualine_x = { 'filesize' },
        lualine_y = { 'encoding', 'filetype' },
        lualine_z = { 'location' },
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { 'filename' },
        lualine_x = { 'location' },
        lualine_y = {},
        lualine_z = {}
    },
    tabline = {},
    winbar = {},
    inactive_winbar = {},
    extensions = {}
}
