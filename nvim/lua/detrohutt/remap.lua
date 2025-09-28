vim.g.mapleader = ' '
vim.keymap.set("n", "<leader>fv", vim.cmd.Ex)
vim.keymap.set("n", "<leader>dn", function()
    vim.diagnostic.jump({count=1, float=true})
end)
vim.keymap.set("n", "<leader>dp", function()
    vim.diagnostic.jump({count=-1, float=true})
end)
vim.keymap.set("n", "<leader>gg", function()
  local cwd = vim.fn.getcwd()
  vim.fn.system({ "tmux", "new-window", "-c", cwd, "lazygit" })
end, { desc = "Git Go (tmux)" })
vim.keymap.set("n", "<leader>lo", vim.lsp.buf.document_symbol, { desc = "Symbol Outline" })
vim.keymap.set("n", "\\g", vim.cmd.GitBlameToggle, { desc = "Code Action" })

vim.keymap.set("i", "<M-f>", "<Plug>(copilot-accept-word)", { desc = "Copilot Accept Word", silent = true })

vim.keymap.set({"n", "i"}, "<C-k>", vim.lsp.buf.signature_help, { desc = "Signature Help" })
