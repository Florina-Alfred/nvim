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
        "wbthomason/packer.nvim",
        "navarasu/onedark.nvim",
        "nvim-tree/nvim-web-devicons",
        "m4xshen/autoclose.nvim",
        "nvim-lua/plenary.nvim",

        "nvim-treesitter/nvim-treesitter",
        "nvim-telescope/telescope.nvim",
        "nvim-treesitter/playground",
        "nvim-treesitter/nvim-treesitter-context",
        "theprimeagen/harpoon",
        "theprimeagen/refactoring.nvim",
        "mbbill/undotree",
        "tpope/vim-fugitive",


        {
            "VonHeikemen/lsp-zero.nvim",
            branch = 'v1.x',
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


        "folke/zen-mode.nvim",
        {
            "numToStr/Comment.nvim",
            config = function()
                require('Comment').setup()
            end
        },


        {
            "folke/trouble.nvim",
            config = function()
                require("trouble").setup {
                    icons = false,
                }
            end
        },

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
            "mrcjkb/rustaceanvim",
            dependencies = { { 'nvim-lua/plenary.nvim', version = '^1.3.1' } }, -- Plenary.nvim is a dependency
            config = function()
                vim.cmd [[autocmd FileType rust setlocal ts=4 sts=4 sw=4]]
            end
        },

    },
    {}

)
--     -- Packer can manage itself
--
--     use {
--         'nvim-telescope/telescope.nvim', tag = '0.1.3',
--         -- or                            , branch = '0.1.x',
--         requires = { { 'nvim-lua/plenary.nvim' } }
--     }
--
--     use {
--         'nvim-treesitter/nvim-treesitter',
--         run = function()
--             local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
--             ts_update()
--         end, }
--
--     use("nvim-treesitter/playground")
--     use("nvim-treesitter/nvim-treesitter-context")
--     use("theprimeagen/harpoon")
--     use("theprimeagen/refactoring.nvim")
--     use("mbbill/undotree")
--     use("tpope/vim-fugitive")
--
--     use {
--         'VonHeikemen/lsp-zero.nvim',
--         branch = 'v1.x',
--         requires = {
--             -- LSP Support
--             { 'neovim/nvim-lspconfig' },
--             { 'williamboman/mason.nvim' },
--             { 'williamboman/mason-lspconfig.nvim' },
--
--             -- Autocompletion
--             { 'hrsh7th/nvim-cmp' },
--             { 'hrsh7th/cmp-buffer' },
--             { 'hrsh7th/cmp-path' },
--             { 'saadparwaiz1/cmp_luasnip' },
--             { 'hrsh7th/cmp-nvim-lsp' },
--             { 'hrsh7th/cmp-nvim-lua' },
--
--             -- Snippets
--             { 'L3MON4D3/LuaSnip' },
--             { 'rafamadriz/friendly-snippets' },
--         }
--     }
--     use("folke/zen-mode.nvim")
--     use {
--         'numToStr/Comment.nvim',
--         config = function()
--             require('Comment').setup()
--         end
--     }
--
--     use({
--         "folke/trouble.nvim",
--         config = function()
--             require("trouble").setup {
--                 icons = false,
--             }
--         end
--     })
--
--     use {
--         'tzachar/local-highlight.nvim',
--         config = function()
--             require('local-highlight').setup()
--         end
--     }
--
--     use({
--         "stevearc/conform.nvim",
--         config = function()
--             require("conform").setup()
--         end,
--     })
--
--     use({
--         "mg979/vim-visual-multi"
--     })
--
--     use {
--         'mrcjkb/rustaceanvim',
--         requires = { { 'nvim-lua/plenary.nvim', version = '^1.3.1' } }, -- Plenary.nvim is a dependency
--         config = function()
--             vim.cmd [[autocmd FileType rust setlocal ts=4 sts=4 sw=4]]
--         end
--     }
-- end)
