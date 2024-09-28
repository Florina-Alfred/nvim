require('refactoring').setup({})

vim.api.nvim_set_keymap("v", "<leader>ff", [[ <Esc><Cmd>lua require('refactoring').refactor('Inline Variable')<CR>]],
    { noremap = true, silent = true, expr = false })
