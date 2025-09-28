return {
    'jedrzejboczar/possession.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = {
        autosave = {
            current = true,
            on_load = true,
            on_quit = true,
        },
        hooks = {
            after_load = function()
                require('detrohutt.rooter').set_root()
            end,
        },
    }
}
