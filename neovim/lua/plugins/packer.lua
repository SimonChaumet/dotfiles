local packer = require("packer")

packer.init({
    display = {
        working_sym = '  ', -- The symbol for a plugin being installed/updated
        error_sym = ' ', -- The symbol for a plugin with an error in installation/updating
        done_sym = ' ', -- The symbol for a plugin which has completed installation/updating
        removed_sym = '- ', -- The symbol for an unused plugin which was removed
        moved_sym = '→ ', -- The symbol for a plugin which was moved (e.g. from opt to start)
        header_sym = '━ ', -- The symbol for the header line in packer's display
    },
})

return require("packer").startup(function(use)
    -- Packer for itself
    use 'wbthomason/packer.nvim'

    -- tree-sitter
    use {
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
        config = function() require("plugins.treesitter") end
    }

    -- fuzzy finder
    use {
        "nvim-telescope/telescope.nvim",
        requires = {
            {
                "nvim-lua/plenary.nvim",
            },
            {
                "nvim-telescope/telescope-fzf-native.nvim",
                run = "make"
            }
        },
    }

    -- Configurations for Nvim LSP
    use {
        'neovim/nvim-lspconfig',
        requires = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
        },
        config = function() require("plugins.lsp") end
    }

    -- auto completion
    use {
        "hrsh7th/nvim-cmp",
        requires = {
            "saadparwaiz1/cmp_luasnip",
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-nvim-lua",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-calc",
            "ray-x/cmp-treesitter",
            "f3fora/cmp-spell",
        },
        config = function() require("plugins.cmp") end
    }

    -- commenting, simplified
    use {
        "numToStr/Comment.nvim",
        config = function() require("plugins.comment") end
    }

    -- autopairs
    use {
        "windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup() end
    }


    -- automatically setup the config after cloning
    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end
end)
