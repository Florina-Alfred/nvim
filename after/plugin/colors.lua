-- Lua
-- Set up tokyonight colorscheme (customize options below if desired)
-- require("tokyonight").setup({
--     -- style = "storm",
--     -- style = "day",
--     -- style = "night",
--     style = "moon",
-- })
-- vim.cmd [[colorscheme tokyonight]]

require("onedark").setup {
    style = "darker"
    -- style = "dark"
    -- style = "cool"
    -- style = "deep"
    -- style = "warm"
    -- style = "warmer"
}
require("onedark").load()

-- function ColorMyPencils(color)
--     color = color or "onedark"
--     vim.cmd.colorscheme(color)
--
--     vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
--     vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
-- end

-- ColorMyPencils()
