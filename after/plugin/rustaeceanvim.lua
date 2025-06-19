vim.g.rustaceanvim = {
    server = {
        on_attach = function(_, bufnr)
            vim.keymap.set("n", "<leader>cR", function()
                vim.cmd.RustLsp("codeAction")
            end, { desc = "Code Action", buffer = bufnr })
            vim.keymap.set("n", "<leader>dr", function()
                vim.cmd.RustLsp("debuggables")
            end, { desc = "Rust Debuggables", buffer = bufnr })
        end,
        default_settings = {
            -- rust-analyzer language server configuration
            ["rust-analyzer"] = {
                cargo = {
                    allFeatures = true,
                    loadOutDirsFromCheck = true,
                    buildScripts = {
                        enable = true,
                    },
                },
                -- Enable diagnostics if using rust-analyzer
                diagnostics = {
                    enable = diagnostics == "rust-analyzer",
                },
                -- Add clippy lints for Rust if using rust-analyzer
                checkOnSave = diagnostics == "rust-analyzer",
                procMacro = {
                    enable = true,
                    ignored = {
                        ["async-trait"] = { "async_trait" },
                        ["napi-derive"] = { "napi" },
                        ["async-recursion"] = { "async_recursion" },
                    },
                },
                files = {
                    excludeDirs = {
                        ".direnv",
                        ".git",
                        ".github",
                        ".gitlab",
                        "bin",
                        "node_modules",
                        "target",
                        "venv",
                        ".venv",
                    },
                },
            },
        },
    },
}


-- vim.g.rustaceanvim = {
--     -- Plugin configuration
--     tools = {
--     },
--     -- LSP configuration
--     server = {
--         on_attach = function(client, bufnr)
--             -- you can also put keymaps in here
--         end,
--         settings = {
--             -- rust-analyzer language server configuration
--             ['rust-analyzer'] = {
--             },
--         },
--     },
--     -- DAP configuration
--     dap = {
--     },
-- }
