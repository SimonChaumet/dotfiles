local cmp = require("cmp")
local cmp_autopairs = require("nvim-autopairs.completion.cmp")

-- If you want insert `(` after select function or method item
cmp.event:on( 'confirm_done', cmp_autopairs.on_confirm_done({  map_char = { tex = '' } }))

-- Custom item icons
local icons = {
    Class           = "",
    Color           = "",
    Constant        = "µ",
    Constructor     = "",
    Enum            = "",
    EnumMember      = "",
    Event           = "",
    Field           = "",
    File            = "",
    Folder          = "",
    Function        = "",
    Keyword         = "",
    Interface       = "",
    Method          = "",
    Module          = "",
    Operator        = "",
    Property        = "",
    Reference       = "",
    Snippet         = "",
    Struct          = "",
    Text            = "",
    TypeParameter   = "",
    Unit            = "",
    Value           = "",
    Variable        = "",
}

cmp.setup {
    completion = {
        autocomplete = true
    },
    sources = {
        { name = "path" },
        { name = "luasnip" },
        { name = "nvim_lsp" },
        { name = "buffer" },
        { name = "nvim_lua" },
        { name = "calc" },
        { name = "spell" },
        { name = "treesitter" },
    },
    formatting = {
        format = function(entry, vim_item)
            vim_item.kind = string.format("%s %s", icons[vim_item.kind],
                vim_item.kind)
            vim_item.menu = ({
                nvim_lsp        = "[lsp]",
                nvim_lua        = "[nvim]",
                luasnip         = "[snip]",
                path            = "[path]",
                buffer          = "[buff]",
                calc            = "[calc]",
                spell           = "[spel]",
                treesitter      = "[tree]",
            })[entry.source.name]
            return vim_item
        end,
    },
    view = {
        entries = {name = 'custom', selection_order = 'near_cursor' }
    },
}
