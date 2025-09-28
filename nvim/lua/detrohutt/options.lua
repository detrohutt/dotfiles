-- General Neovim options
local opt = vim.opt

-- Indentation settings
opt.expandtab = true        -- Use spaces instead of tabs
opt.shiftwidth = 4          -- Number of spaces for indentation
opt.tabstop = 4             -- Number of spaces a tab counts for
opt.softtabstop = 4         -- Spaces per tab when editing

-- Line numbers
opt.relativenumber = true   -- Show relative line numbers

-- Code folding
vim.o.foldmethod = 'expr'
-- Default to treesitter folding
vim.o.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
-- Prefer LSP folding if client supports it
vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client:supports_method('textDocument/foldingRange') then
      local win = vim.api.nvim_get_current_win()
      vim.wo[win][0].foldexpr = 'v:lua.vim.lsp.foldexpr()'
    end
  end,
})
opt.foldlevelstart = 99   -- Start with all folds open
opt.foldenable = true     -- Enable folding

return {} -- Return an empty table to indicate a module (optional)
