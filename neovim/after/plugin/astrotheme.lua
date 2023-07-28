require("astrotheme").setup({
  palette = "astrodark", -- String of the default palette to use when calling `:colorscheme astrotheme`

  termguicolors = true, -- Bool value, toggles if termguicolors are set by AstroTheme.

  terminal_color = true, -- Bool value, toggles if terminal_colors are set by AstroTheme.
})

vim.cmd 'colorscheme astrotheme'
