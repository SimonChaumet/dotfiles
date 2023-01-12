local lspconfig = require("lspconfig")
local mason = require("mason")
local mason_lspconfig = require("mason-lspconfig")

local globals = require("globals")
local signs = {
    Error = globals.sign_error,
    Warn  = globals.sign_warn,
    Hint  = globals.sign_hint,
    Info  = globals.sign_info,
}

for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, {
        text = icon,
        texthl = hl,
        numhl = hl
    })
end

vim.diagnostic.config({
    update_in_insert = true
})

local on_attach = function(_, bufnr)
    local opts = { buffer = bufnr }
    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
    vim.keymap.set("n", "<leader>ln", vim.diagnostic.goto_next, opts)
    vim.keymap.set("n", "<leader>lp", vim.diagnostic.goto_prev, opts)
    vim.keymap.set("n", "<leader>lf", vim.lsp.buf.formatting, opts)
    vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
    vim.keymap.set("n", "<leader>wa",
            vim.lsp.buf.add_workspace_folder, opts)
    vim.keymap.set("n", "<leader>wr",
            vim.lsp.buf.remove_workspace_folder, opts)
    vim.keymap.set("n", "<leader>wl", function()
        vim.inspect(vim.lsp.buf.list_workspace_folders())
    end, opts)
    vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, opts)
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
    vim.keymap.set("n", "<leader>so",
            require("telescope.builtin").lsp_document_symbols, opts)
end

-- nvim-cmp supports additional completion capabilities
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

local servers = {
    "tsserver",
    "rust_analyzer",
    "sumneko_lua",
}

mason.setup({
    ui = {
        icons = {
            server_installed = "✓",
            server_pending = "o",
            server_uninstalled = ""
        }
    }
})

_G.lsp_root_dir = vim.fn.stdpath("data") .. "/mason/bin"

mason_lspconfig.setup({
    ensure_installed = servers,
})


for _, server in ipairs(servers) do
    local opts = {
        on_attach = on_attach,
        capabilities = capabilities,
    }

    local plugin = string.format("plugins.lsp.%s", server)
    require(plugin).setup(opts)

    lspconfig[server].setup(opts)
end
