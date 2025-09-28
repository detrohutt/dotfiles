return {
    "sbdchd/neoformat",
    lazy = false,
    cmd = { "Neoformat" },
    config = function()
        vim.g.neoformat_enabled_javascript = { "prettier" }
        vim.g.neoformat_enabled_typescript = { "prettier" }
        vim.g.neoformat_enabled_json = { "prettier" }
        vim.g.neoformat_enabled_html = { "prettier" }
        vim.g.neoformat_enabled_css = { "prettier" }
        vim.g.neoformat_enabled_markdown = { "prettier" }
        vim.g.neoformat_try_node_exe = 1
        vim.api.nvim_create_autocmd("BufWritePre", {
            pattern = { "*.js", "*.ts", "*.lua", "*.json", "*.md" },
            command = "Neoformat",
        })
    end,
    }
