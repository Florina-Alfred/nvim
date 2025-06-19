-- Set undotree to focus the undotree panel when toggled
vim.g.undotree_SetFocusWhenToggle = 1

vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
