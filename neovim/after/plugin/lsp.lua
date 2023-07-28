local lsp = require('lsp-zero').preset({})

lsp.on_attach(function(client, bufnr)
  -- lsp.default_keymaps({buffer = bufnr})
  local opts = {buffer = bufnr, remap = false}

  vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
  vim.keymap.set("n", "gr", function() vim.lsp.buf.references() end, opts)
  vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
  vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
  vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
  vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
  vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
  vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
  vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
  vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
  vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
end)

lsp.ensure_installed({
	'tsserver',
	'lua_ls',
	'eslint',
	'stylelint_lsp',
})

local cmp = require('cmp')
local cmp_mappings = lsp.defaults.cmp_mappings({
	['<C-y'] = cmp.mapping.confirm({select = true}),
	["<C-Space>"] = cmp.mapping.complete(),
})

lsp.set_sign_icons({
  error = '✘',
  warn = '▲',
  hint = '⚑',
  info = '»',
})

-- (Optional) Configure lua language server for neovim
require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

local function rename_file()
    local source_file, target_file

    vim.ui.input({
        prompt = "Source : ",
        completion = "file",
        default = vim.api.nvim_buf_get_name(0)
    },
        function(input)
            source_file = input
        end
    )
    vim.ui.input({
        prompt = "Target : ",
        completion = "file",
        default = source_file
    },
        function(input)
            target_file = input
        end
    )

    local params = {
        command = "_typescript.applyRenameFile",
        arguments = {
            {
                sourceUri = source_file,
                targetUri = target_file,
            },
        },
        title = ""
    }

    vim.lsp.util.rename(source_file, target_file)
    vim.lsp.buf.execute_command(params)
end


require("lspconfig").tsserver.setup {
	on_attach = function (client)
		if client.name == "tsserver" then
			vim.api.nvim_create_user_command("RenameTS", rename_file, {desc = 'Rename file'})
		end
	end
}

--[[ require("lspconfig").cucumber_language_server.setup {
	settings = {
		cucumber = {
			features = { "tests/**/*.feature" },
			glue = { "tests/**/*.steps.js" },
		},
	}
} ]]

require'lspconfig'.cucumber_language_server.setup{
    settings = {
        cucumber = {
            features = { "**/*.feature" },
            glue = { "**/*.steps.js", "**/*.step.js" }
        }
    },
    --[[ on_attach = function(client, bufnr)
        vim.keymap.set('n', "<C-]>", vim.lsp.buf.definition, {buffer=0})
        vim.keymap.set('n', "gn", vim.diagnostic.goto_next, {buffer=0})
        vim.keymap.set('n', "gb", vim.diagnostic.goto_prev, {buffer=0})
    end ]]
}

lsp.setup()
