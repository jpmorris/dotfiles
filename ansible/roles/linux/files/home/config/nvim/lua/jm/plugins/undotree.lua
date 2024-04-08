return {
    "jiaoshijie/undotree",
    dependencies = "nvim-lua/plenary.nvim",
    cond = function() return not vim.g.vscode end,
    config = true,
    keys = { -- load the plugin only when using it's keybinding:
        { "<leader>u", "<cmd>lua require('undotree').toggle()<cr>" },
    },
}
