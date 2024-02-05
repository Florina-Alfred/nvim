local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup(
    {
        "navarasu/onedark.nvim",
        "nvim-tree/nvim-web-devicons",
        "m4xshen/autoclose.nvim",
        "nvim-lua/plenary.nvim",
        {
            {
                "nvim-treesitter/nvim-treesitter",
                build = ":TSUpdate"
            }
        },

        "nvim-telescope/telescope.nvim",
        -- "nvim-treesitter/playground",
        -- "nvim-treesitter/nvim-treesitter-context",
        "theprimeagen/harpoon",
        "theprimeagen/refactoring.nvim",
        "mbbill/undotree",
        "tpope/vim-fugitive",

        {
            "VonHeikemen/lsp-zero.nvim",
            branch = 'v3.x',
            dependencies = {
                -- LSP Support
                { 'neovim/nvim-lspconfig' },
                { 'williamboman/mason.nvim' },
                { 'williamboman/mason-lspconfig.nvim' },

                -- Autocompletion
                { 'hrsh7th/nvim-cmp' },
                { 'hrsh7th/cmp-buffer' },
                { 'hrsh7th/cmp-path' },
                { 'saadparwaiz1/cmp_luasnip' },
                { 'hrsh7th/cmp-nvim-lsp' },
                { 'hrsh7th/cmp-nvim-lua' },

                -- Snippets
                { 'L3MON4D3/LuaSnip' },
                { 'rafamadriz/friendly-snippets' },
            }
        },

        {
            "folke/trouble.nvim",
            dependencies = { "nvim-tree/nvim-web-devicons" },
            opts = {
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            },
        },

        -- {
        --     "folke/trouble.nvim",
        --     config = function()
        --         require("trouble").setup {
        --             icons = false,
        --         }
        --     end
        -- },

        {
            "tzachar/local-highlight.nvim",
            config = function()
                require('local-highlight').setup()
            end
        },


        {
            "stevearc/conform.nvim",
            config = function()
                require("conform").setup()
            end,
        },

        {
            "mg979/vim-visual-multi"
        },


        {
            'numToStr/Comment.nvim',
            opts = {
                -- add any options here
            },
            lazy = false,
        },


        -- {
        --     "mrcjkb/rustaceanvim",
        --     dependencies = { { 'nvim-lua/plenary.nvim', version = '^1.3.1' } }, -- Plenary.nvim is a dependency
        --     config = function()
        --         vim.cmd [[autocmd FileType rust setlocal ts=4 sts=4 sw=4]]
        --     end
        -- },

        -- {
        --     'mrcjkb/rustaceanvim',
        --     version = '^4', -- Recommended
        --     ft = { 'rust' },
        -- }

        {
            "mrcjkb/rustaceanvim",
            version = "^3",
            dependencies = {
                "nvim-lua/plenary.nvim",
                "mfussenegger/nvim-dap",
                {
                    "lvimuser/lsp-inlayhints.nvim",
                    opts = {}
                },
            },
            ft = { "rust" },
            config = function()
                vim.g.rustaceanvim = {
                    inlay_hints = {
                        highlight = "NonText",
                    },
                    tools = {
                        hover_actions = {
                            auto_focus = true,
                        },
                    },
                    server = {
                        on_attach = function(client, bufnr)
                            require("lsp-inlayhints").on_attach(client, bufnr)
                        end
                    }
                }
            end
        }


    },
    {}

)
