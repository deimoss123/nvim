local null_ls = require 'null-ls'
--
local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

null_ls.setup {
  sources = {
    formatting.prettierd,
    formatting.stylua,
    formatting.rustfmt,
    diagnostics.eslint_d.with {
      diagnostics_format = '[eslint] #{m}\n(#{c})',
    },
  },
}
