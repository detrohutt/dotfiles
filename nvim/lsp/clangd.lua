local function on_attach(_, bufnr)
    vim.keymap.set("n", "<leader>lh", function()
        local params = { uri = vim.uri_from_bufnr(0) }
        local result = vim.lsp.buf_request_sync(0, "textDocument/switchSourceHeader", params, 1000)

        if result then
            for _, res in pairs(result) do
                if res.result then
                    vim.cmd("edit " .. vim.uri_to_fname(res.result))
                    return
                end
            end
        end
        print("No corresponding source/header file found")
    end, { desc = "Switch between source/header", buffer = bufnr })
end

return {
    cmd = {
        'clangd',
        '--clang-tidy',
        '--background-index',
        '--offset-encoding=utf-8',
        '--log=error',
    },
    filetypes = { 'c', 'cpp', 'objc', 'objcpp', 'cuda', 'proto' },
    root_markers = {
        '.clangd',
        '.clang-tidy',
        '.clang-format',
        'compile_commands.json',
        'compile_flags.txt',
        'configure.ac' -- AutoTools
    },
    capabilities = {
      textDocument = {
        completion = {
          editsNearCursor = true,
        },
      },
      offsetEncoding = { 'utf-8', 'utf-16' },
    },
    on_attach = on_attach,
}
