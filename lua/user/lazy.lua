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

require("lazy").setup(
    {
        "navarasu/onedark.nvim",

        {
            "echasnovski/mini.nvim",
            version = '*',
        },

        "nvim-lua/plenary.nvim",

        {
            "folke/snacks.nvim",
            priority = 1000,
            lazy = false,
            ---@type snacks.Config
        },

        "m4xshen/hardtime.nvim",

        {
            {
                "nvim-treesitter/nvim-treesitter",
                build = ":TSUpdate"
            }
        },

        "nvim-telescope/telescope.nvim",

        {
            "theprimeagen/harpoon",
            branch = "harpoon2",
            config = function()
                require("harpoon"):setup()
            end,
            keys = {
                { "<leader>A", function() require("harpoon"):list():add() end,     desc = "harpoon file", },
                {
                    "<leader>a",
                    function()
                        local harpoon = require("harpoon")
                        harpoon.ui:toggle_quick_menu(harpoon:list())
                    end,
                    desc = "harpoon quick menu",
                },
                { "<leader>1", function() require("harpoon"):list():select(1) end, desc = "harpoon to file 1", },
                { "<leader>2", function() require("harpoon"):list():select(2) end, desc = "harpoon to file 2", },
                { "<leader>3", function() require("harpoon"):list():select(3) end, desc = "harpoon to file 3", },
                { "<leader>4", function() require("harpoon"):list():select(4) end, desc = "harpoon to file 4", },
                { "<leader>5", function() require("harpoon"):list():select(5) end, desc = "harpoon to file 5", },
                { "<leader>6", function() require("harpoon"):list():select(6) end, desc = "harpoon to file 6", },
            },
        },

        "theprimeagen/refactoring.nvim",
        "mbbill/undotree",
        "tpope/vim-fugitive",

        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",

        {
            "VonHeikemen/lsp-zero.nvim",
            branch = "v3.x"
        },
        "neovim/nvim-lspconfig",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/nvim-cmp",
        "L3MON4D3/LuaSnip",

        {
            "folke/trouble.nvim",
            opts = {
            },
        },

        {
            "tzachar/local-highlight.nvim",
            config = function()
                require("local-highlight").setup()
            end
        },


        {
            "stevearc/conform.nvim",
            config = function()
                require("conform").setup()
            end,
        },

        "mg979/vim-visual-multi",

        {
            "numToStr/Comment.nvim",
            opts = {
            },
            lazy = false,
        },


        {
            "saecki/crates.nvim",
            tag = "stable",
            config = function()
                require("crates").setup()
            end,
        },

        -- {
        --     "mrcjkb/rustaceanvim",
        --     version = "^3",
        --     dependencies = {
        --         "nvim-lua/plenary.nvim",
        --         "mfussenegger/nvim-dap",
        --         {
        --             "lvimuser/lsp-inlayhints.nvim",
        --             opts = {}
        --         },
        --     },
        --     ft = { "rust" },
        --     config = function()
        --         vim.g.rustaceanvim = {
        --             inlay_hints = {
        --                 highlight = "NonText",
        --             },
        --             tools = {
        --                 hover_actions = {
        --                     auto_focus = true,
        --                 },
        --             },
        --             server = {
        --                 on_attach = function(client, bufnr)
        --                     require("lsp-inlayhints").on_attach(client, bufnr)
        --                 end
        --             }
        --         }
        --     end
        -- },

        "nvim-lualine/lualine.nvim",

        -- "stevearc/oil.nvim",

        "lewis6991/gitsigns.nvim",
        {
            "vladdoster/remember.nvim",
            config = [[ require("remember") ]]
        },

        {
            "folke/noice.nvim",
            event = "VeryLazy",
            dependencies = {
                "MunifTanjim/nui.nvim",
            }
        },

        {
            "yetone/avante.nvim",
            -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
            -- ⚠️ must add this setting! ! !
            build = function()
                -- conditionally use the correct build system for the current OS
                if vim.fn.has("win32") == 1 then
                    return "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false"
                else
                    return "make"
                    -- return "make BUILD_FROM_SOURCE=true"
                end
            end,
            event = "VeryLazy",
            version = false, -- Never set this value to "*"! Never!
            ---@module 'avante'
            ---@type avante.Config
            opts = {
                -- add any opts here
                -- for example
                provider = "copilot",
                providers = {
                    copilot = {
                        model = "gpt-4.1",
                    },
                },
            },
            dependencies = {
                --- The below dependencies are optional,
                "echasnovski/mini.pick",       -- for file_selector provider mini.pick
                "hrsh7th/nvim-cmp",            -- autocompletion for avante commands and mentions
                "ibhagwan/fzf-lua",            -- for file_selector provider fzf
                "stevearc/dressing.nvim",      -- for input provider dressing
                "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
                "zbirenbaum/copilot.lua",      -- for providers='copilot'
                {
                    -- support for image pasting
                    "HakonHarnes/img-clip.nvim",
                    event = "VeryLazy",
                    opts = {
                        -- recommended settings
                        default = {
                            embed_image_as_base64 = false,
                            prompt_for_file_name = false,
                            drag_and_drop = {
                                insert_mode = true,
                            },
                            -- required for Windows users
                            use_absolute_path = true,
                        },
                    },
                },
                {
                    -- Make sure to set this up properly if you have lazy=true
                    'MeanderingProgrammer/render-markdown.nvim',
                    opts = {
                        file_types = { "markdown", "Avante" },
                    },
                    ft = { "markdown", "Avante" },
                },
            },
        }

    },
    {}

)
