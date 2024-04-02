return {
    'smoka7/hop.nvim',
    version = "*",
    opts = {},
    config = function()
        require('hop').setup({})
        vim.keymap.set('n', '<leader>f', ':HopChar1<cr>', {silent = true})
    end
}
