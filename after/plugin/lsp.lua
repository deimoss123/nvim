local lsp = require('lsp-zero')

lsp.preset("recommended")

lsp.ensure_installed({
    'tsserver',
    'eslint',
    'rust_analyzer',
})

local cmp = require("cmp")
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mapping = lsp.defaults.cmp_mappings({
    ['<C-p>'] = cmp.mapping.select_next_item(cmp_select),
    ['<C-k>'] = cmp.mapping.select_prev_item(cmp_select),
})

cmp.setup({
    experimental = {
        ghost_text = true,
        native_menu = false
    }
})

local cmp_autopairs = require('nvim-autopairs.completion.cmp')
cmp.event:on(
    'confirm_done',
    cmp_autopairs.on_confirm_done()
)

-- lsp.set_preferences({
--     sign_icons = {}
-- })

lsp.setup_nvim_cmp({ mapping = cmp_mappings })

lsp.on_attach(function(client, bufnr)
    local nmap = function(keys, func, desc)
        vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc, remap = false })
    end

    local builtin = require('telescope.builtin')

    nmap("gd", vim.lsp.buf.definition, '[G]oto [D]efinition')
    nmap('gr', builtin.lsp_references, '[G]oto [R]eferences')

    nmap("K", vim.lsp.buf.hover, '[K] Hover')
    nmap("[d", vim.diagnostic.goto_next, '')
    nmap("]d", vim.diagnostic.goto_prev, '')

    nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')

    local group = vim.api.nvim_create_augroup("lsp_format_on_save", { clear = false })
    local event = "BufWritePre" -- or "BufWritePost"
    local async = event == "BufWritePost"

    if client.supports_method("textDocument/formatting") then
        vim.keymap.set("n", "<C-f>", function()
            vim.lsp.buf.format({ bufnr = vim.api.nvim_get_current_buf() })
        end, { buffer = bufnr, desc = "[lsp] format" })

        -- format on save
        -- vim.api.nvim_clear_autocmds({ buffer = bufnr, group = group })
        -- vim.api.nvim_create_autocmd(event, {
        --     buffer = bufnr,
        --     group = group,
        --     callback = function()
        --         vim.lsp.buf.format({ bufnr = bufnr, async = async })
        --     end,
        --     desc = "[lsp] format on save",
        -- })
    end

    if client.supports_method("textDocument/rangeFormatting") then
        vim.keymap.set("x", "<C-f>", function()
            vim.lsp.buf.format({ bufnr = vim.api.nvim_get_current_buf() })
        end, { buffer = bufnr, desc = "[lsp] format" })
    end
end)

lsp.nvim_workspace()
lsp.setup()

vim.lsp.handlers['textDocument/publishDiagnostics'] =
    vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
        underline = true,
        virtual_text = true,
    })
