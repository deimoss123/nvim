local cmp = require 'cmp'
local types = require 'cmp.types'
local lspkind = require 'lspkind'

local function border(hl_name)
  return {
    { '╭', hl_name },
    { '─', hl_name },
    { '╮', hl_name },
    { '│', hl_name },
    { '╯', hl_name },
    { '─', hl_name },
    { '╰', hl_name },
    { '│', hl_name },
  }
end

local icons = {
  Namespace = '',
  Text = ' ',
  Method = ' ',
  Function = ' ',
  Constructor = ' ',
  Field = 'ﰠ ',
  Variable = ' ',
  Class = 'ﴯ ',
  Interface = ' ',
  Module = ' ',
  Property = 'ﰠ ',
  Unit = '塞 ',
  Value = ' ',
  Enum = ' ',
  Keyword = ' ',
  Snippet = ' ',
  Color = ' ',
  File = ' ',
  Reference = ' ',
  Folder = ' ',
  EnumMember = ' ',
  Constant = ' ',
  Struct = 'פּ ',
  Event = ' ',
  Operator = ' ',
  TypeParameter = ' ',
  Table = '',
  Object = ' ',
  Tag = '',
  Array = '[]',
  Boolean = ' ',
  Number = ' ',
  Null = 'ﳠ',
  String = ' ',
  Calendar = '',
  Watch = ' ',
  Package = '',
  Copilot = ' ',
}

local cmp_autopairs = require 'nvim-autopairs.completion.cmp'
local handlers = require 'nvim-autopairs.completion.handlers'

cmp.event:on(
  'confirm_done',
  cmp_autopairs.on_confirm_done {
    filetypes = {
      -- "*" is a alias to all filetypes
      ['*'] = {
        ['('] = {
          kind = {
            cmp.lsp.CompletionItemKind.Function,
            cmp.lsp.CompletionItemKind.Method,
          },
          handler = handlers['*'],
        },
      },
    },
  }
)

local function deprioritize_snippet(entry1, entry2)
  if entry1:get_kind() == types.lsp.CompletionItemKind.Snippet then
    return false
  end
  if entry2:get_kind() == types.lsp.CompletionItemKind.Snippet then
    return true
  end
end

cmp.setup {
  experimental = {
    ghost_text = true,
    -- native_menu = false,
  },

  window = {
    completion = {
      border = border 'CmpBorder',
      winhighlight = 'Normal:CmpPmenu,CursorLine:PmenuSel,Search:None',
    },

    documentation = {
      border = border 'CmpDocBorder',
    },
  },

  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  formatting = {
    -- fields = { 'kind', 'abbr', 'menu' },
    -- format = function(_, vim_item)
    --   vim_item.kind = 'chau'
    --   return vim_item
    -- end,
    format = lspkind.cmp_format {
      mode = 'symbol_text', -- show only symbol annotations
      maxwidth = 70, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
      ellipsis_char = '...', -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
      -- The function below will be called before any actual modifications from lspkind
      -- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
      before = function(entry, vim_item)
        return vim_item
      end,
    },
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    { name = 'nvim_lua' },
    { name = 'buffer' },
    { name = 'path' },
  },
  sorting = {
    priority_weight = 2,
    comparators = {
      deprioritize_snippet,
      -- the rest of the comparators are pretty much the defaults
      cmp.config.compare.offset,
      cmp.config.compare.exact,
      cmp.config.compare.scopes,
      cmp.config.compare.score,

      cmp.config.compare.recently_used,
      cmp.config.compare.locality,
      cmp.config.compare.kind,
      cmp.config.compare.sort_text,
      cmp.config.compare.length,
      cmp.config.compare.order,
    },
  },
}
