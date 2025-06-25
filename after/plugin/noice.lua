require("noice").setup({
    lsp = {
        -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
        override = {
            ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
            ["vim.lsp.util.stylize_markdown"] = true,
            ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
        },
    },
    -- you can enable a preset for easier configuration
    presets = {
        bottom_search = false,        -- use a classic bottom cmdline for search
        command_palette = true,       -- position the cmdline and popupmenu together
        long_message_to_split = true, -- long messages will be sent to a split
        inc_rename = false,           -- enables an input dialog for inc-rename.nvim
        lsp_doc_border = false,       -- add a border to hover docs and signature help
    },
    routes = {
        {
            filter = {
                event = "msg_show",
                min_height = 5,
            },
            view = "split",
            opts = {
                -- Use callback to focus the split after showing error
                on_open = function(win)
                    vim.schedule(function()
                        vim.api.nvim_set_current_win(win)
                    end)
                end,
            },
        },
        {
            filter = {
                event = "notify",
                min_height = 5,
            },
            view = "split",
            opts = {
                -- Use callback to focus the split after showing error
                on_open = function(win)
                    vim.schedule(function()
                        vim.api.nvim_set_current_win(win)
                    end)
                end,
            },
        },
        {
            filter = {
                event = "lsp",
                min_height = 5,
                kind = "message",
            },
            view = "split",
            opts = {
                -- Use callback to focus the split after showing error
                on_open = function(win)
                    vim.schedule(function()
                        vim.api.nvim_set_current_win(win)
                    end)
                end,
            },
        },
        -- Focus the split when an error message appears
        {
            filter = {
                event = "msg_show",
                min_height = 5,
                kind = "error",
            },
            view = "split",
            opts = {
                -- Use callback to focus the split after showing error
                on_open = function(win)
                    vim.schedule(function()
                        vim.api.nvim_set_current_win(win)
                    end)
                end,
            },
        },
    },
})
