require('snacks').setup({
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
    bigfile = { enabled = true },
    dashboard = { enabled = false },
    explorer = { enabled = false },
    indent = { enabled = true },
    input = { enabled = true },
    picker = { enabled = true },
    notifier = {
        enabled = true,
        -- margin = {
        --     top = 1,
        --     bottom = 1,
        --     left = 210,
        --     right = 210,
        -- },
        -- top_down = true,
    },
    split = { enabled = true },
    quickfile = { enabled = true },
    scope = { enabled = true },
    scroll = { enabled = true },
    statuscolumn = { enabled = true },
    words = { enabled = true },
})
