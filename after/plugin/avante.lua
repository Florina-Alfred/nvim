local function read_system_prompt()
    local file = io.open(vim.fn.stdpath("config") .. "/system_prompt.txt", "r")
    if not file then return nil end
    local content = file:read("*a")
    file:close()
    return content
end

require("avante").setup({
    -- add any opts here
    -- for example
    system_prompt = read_system_prompt(),
    auto_suggestions_provider = "copilot",
    provider = "copilot",
    providers = {
        copilot = {
            model = "gpt-4.1",
        },
    },
    -- auto_suggestions_provider = "ollama",
    -- provider = "ollama",
    -- providers = {
    --     ollama = {
    --         endpoint = "http://localhost:11434",
    --         model = "mistral:latest",
    --     },
    -- },
    behaviour = {
        auto_suggestions = true, -- Experimental stage
        -- auto_suggestions = false, -- Experimental stage
        auto_set_highlight_group = true,
        auto_set_keymaps = true,
        auto_apply_diff_after_generation = false,
        support_paste_from_clipboard = true,
        minimize_diff = true,                  -- Whether to remove unchanged lines when applying a code block
        enable_token_counting = true,          -- Whether to enable token counting. Default to true.
        auto_approve_tool_permissions = false, -- Default: show permission prompts for all tools
        -- Examples:
        -- auto_approve_tool_permissions = true,                -- Auto-approve all tools (no prompts)
        -- auto_approve_tool_permissions = {"bash", "replace_in_file"}, -- Auto-approve specific tools only
    },
    web_search_engine = {
        provider = "searxng",          -- tavily, serpapi, google, kagi, brave, or searxng
        proxy = "http://0.0.0.0:8081", -- proxy support, e.g., http://127.0.0.1:7890
    },
    mappings = {
        suggestion = {
            accept = "<C-x>",
            next = "<C-j>",
            prev = "<C-k>",
        }
    },
    windows = {
        input = {
            prefix = "> ",
            height = 12,
            -- provider = "snacks",
            -- provider_opts = {
            --     title = "Avante Input",
            --     icon = " ",
            -- },
        }
    }

})
