local null_ls = require 'null-ls'
--
-- local group = vim.api.nvim_create_augroup("lsp_format_on_save", { clear = false })
-- local event = "BufWritePre" -- or "BufWritePost"
-- local async = event == "BufWritePost"
local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

null_ls.setup {
  sources = {
    formatting.prettier.with { extra_args = { '--single-quote', '--print-width', '100', '--arrow-parens', 'avoid' } },
    formatting.stylua,
    formatting.rustfmt,
    diagnostics.eslint,
  },
}
