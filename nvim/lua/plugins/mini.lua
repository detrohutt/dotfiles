return {
    'echasnovski/mini.nvim',
    version = false,
    config = function()
        require('mini.basics').setup()
        require('mini.ai').setup()
        require('mini.surround').setup()
        require('mini.operators').setup({ replace = { prefix = 'gR' } })
        require('mini.comment').setup()
    end
}
