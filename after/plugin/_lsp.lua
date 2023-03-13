local lsp = require 'lsp-zero'

lsp.preset 'recommended'

lsp.ensure_installed {
  'rust_analyzer',
  'jsonls',
  'html',
  'cssls',
  'tsserver',
}

local cmp = require 'cmp'
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mapping = lsp.defaults.cmp_mappings {
  -- ['<C-p>'] = cmp.mapping.select_next_item(cmp_select),
  -- ['<C-k>'] = cmp.mapping.select_prev_item(cmp_select),
}

lsp.setup_nvim_cmp { mapping = cmp_mapping }

lsp.on_attach(function(client, bufnr)
  local nmap = function(keys, func, desc)
    vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc, remap = false })
  end

  local builtin = require 'telescope.builtin'

  nmap('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
  nmap('gr', builtin.lsp_references, '[G]oto [R]eferences')

  nmap('K', vim.lsp.buf.hover, '[K] Hover')
  nmap('[d', vim.diagnostic.goto_next, '')
  nmap(']d', vim.diagnostic.goto_prev, '')

  nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')

  local group = vim.api.nvim_create_augroup('lsp_format_on_save', { clear = false })
  local event = 'BufWritePre' -- or "BufWritePost"
  local async = event == 'BufWritePost'

  if client.supports_method 'textDocument/formatting' then
    vim.keymap.set('n', '<C-f>', function()
      vim.lsp.buf.format { bufnr = vim.api.nvim_get_current_buf() }
      vim.cmd.w()
    end, { buffer = bufnr, desc = '[lsp] format' })

    -- format on save
    vim.api.nvim_clear_autocmds { buffer = bufnr, group = group }
    vim.api.nvim_create_autocmd(event, {
      buffer = bufnr,
      group = group,
      callback = function()
        vim.lsp.buf.format { bufnr = bufnr, async = async }
      end,
      desc = '[lsp] format on save',
    })
  end

  if client.supports_method 'textDocument/rangeFormatting' then
    vim.keymap.set('x', '<C-f>', function()
      vim.lsp.buf.format { bufnr = vim.api.nvim_get_current_buf() }
      vim.cmd.w()
    end, { buffer = bufnr, desc = '[lsp] format' })
  end
end)

vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
  underline = true,
  virtual_text = true,
})

lsp.configure('jsonls', {
  settings = {
    json = {
      schemas = require('schemastore').json.schemas(),
      validate = { enable = true },
    },
  },
})

-- local capabilities = vim.lsp.protocol.make_client_capabilities()
-- capabilities.textDocument.completion.completionItem.snippetSupport = true
--
-- lsp.configure('emmet_ls', {
--   capabilities = capabilities,
--   filetypes = { 'html', 'typescriptreact', 'javascriptreact', 'css', 'sass', 'scss', 'less' },
--   init_options = {
--     html = {
--       options = {
--         -- For possible options, see: https://github.com/emmetio/emmet/blob/master/src/config.ts#L79-L267
--         ['bem.enabled'] = true,
--       },
--     },
--   },
-- })

lsp.nvim_workspace()
lsp.setup()

require('nvim-surround').setup {}
