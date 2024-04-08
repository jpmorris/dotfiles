return {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    cond = function() return not vim.g.vscode end,
    config = function()
        require('lualine').setup()
    end

}
