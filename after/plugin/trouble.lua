-- vim.keymap.set("n", "<leader>xq", "<cmd>TroubleToggle quickfix<cr>",
--     { silent = true, noremap = true }
-- )

-- Setup trouble with focus option enabled
require("trouble").setup({
    focus = true,
    auto_open = false,
    auto_close = true,
    auto_preview = true,
    auto_fold = false,
    use_diagnostic_signs = true,
    -- Add keymaps configuration
    keys = {
        -- Keymaps for trouble navigation and actions
        { "<leader>xx", function() require("trouble").toggle("diagnostics") end,           desc = "Toggle Diagnostics" },
        { "<leader>xw", function() require("trouble").toggle("workspace_diagnostics") end, desc = "Toggle Workspace Diagnostics" },
        { "<leader>xd", function() require("trouble").toggle("document_diagnostics") end,  desc = "Toggle Document Diagnostics" },
        { "<leader>xq", function() require("trouble").toggle("quickfix") end,              desc = "Toggle Quickfix List" },
        { "<leader>xl", function() require("trouble").toggle("loclist") end,               desc = "Toggle Location List" },
        { "gR",         function() require("trouble").toggle("lsp_references") end,        desc = "Toggle LSP References" },
    }
})
