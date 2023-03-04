local prettier = require 'prettier'

prettier.setup {
  bin = 'prettierd',
  filetypes = {
    'css',
    'graphql',
    'html',
    'javascript',
    'javascriptreact',
    'json',
    'less',
    'markdown',
    'scss',
    'typescript',
    'typescriptreact',
    'yaml',
  },
  ['null-ls'] = {
    condition = function()
      return prettier.config_exists {
        check_package_json = true,
      }
    end,
    timeout = 5000,
  },
  cli_options = {
    config_precedence = 'prefer-file',

    arrow_parens = 'avoid',
    bracket_spacing = true,
    bracket_same_line = false,
    embedded_language_formatting = 'auto',
    end_of_line = 'lf',
    html_whitespace_sensitivity = 'css',
    -- jsx_bracket_same_line = false,
    jsx_single_quote = false,
    print_width = 80,
    prose_wrap = 'preserve',
    quote_props = 'as-needed',
    semi = true,
    single_attribute_per_line = false,
    --
    -- defalt: false
    single_quote = true,
    tab_width = 2,
    trailing_comma = 'es5',
    use_tabs = false,
    vue_indent_script_and_style = false,
  },
}
