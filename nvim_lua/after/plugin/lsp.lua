local lspconfig = require('lspconfig')
local lsp = require('lsp-zero').preset("lsp-only")
lsp.ensure_installed({
	'tsserver',
	'eslint',
})


lsp.on_attach(function(client, bufnr)
    local bind = vim.keymap.set
    local opt = {buffer = bufnr}

    bind("n", "<leader>H", "<cmd>lua vim.lsp.buf.signature_help()<cr>", opt)
    --  This is where a variable was first declared, or where a function is defined, etc.
    bind("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", opt)
    -- WARN: This is not Goto Definition, this is Goto Declaration.
    --  For example, in C this would take you to the header.
    bind("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", opt)
    -- Jump to the implementation of the word under your cursor.
    --  Useful when your language has ways of declaring types without an actual implementation.
    bind("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", opt)
    --  Useful when you"re not sure what type a variable is and you want to see
    --  the definition of its *type*, not where it was *defined*.
    bind("n", "go", "<cmd>lua vim.lsp.buf.type_definition()<cr>", opt)
    -- Fuzzy find all the symbols in your current document.
    --  Symbols are things like variables, functions, types, etc.
    bind("n", "gS", "<cmd>lua vim.lsp.buf.document_symbol<cr>", opt)
    bind("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<cr>", opt)
    bind("n", "<leader>fm", "<cmd>lua vim.lsp.buf.format({async = true})<cr>", opt)
    bind("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<cr>", opt)
end)

lsp.setup()

vim.diagnostic.config({
    virtual_text = true,
    signs = true,
    update_in_insert = false,
    underline = true,
    severity_sort = false,
    float = true,
})

lspconfig.lua_ls.setup({
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' }
            }
        }
    }
})
