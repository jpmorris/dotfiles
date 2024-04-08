return {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
    cond = function() return not vim.g.vscode end,
    config = function()
        vim.cmd[[colorscheme tokyonight]]
    end,
}
