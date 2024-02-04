require("conform").setup({
    formatters_by_ft = {
        python = { "black" },
        go = { "gofmt" },
        javascript = { { "prettierd", "prettier" } },
        rust = { "rust-analyser" },
        -- terraform = { "terraform-ls" },
    },
    format_on_save = {
        -- These options will be passed to conform.format()
        timeout_ms = 500,
        lsp_fallback = true,
    },
})
