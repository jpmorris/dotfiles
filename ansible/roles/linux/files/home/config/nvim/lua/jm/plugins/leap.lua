return {
    "ggandor/leap.nvim",
    config = function(_, opts)
        local leap = require("leap")
        for k, v in pairs(opts) do
            leap.opts[k] = v
        end
        vim.keymap.set("n", "<leader><leader>", function()
            require("leap").leap({ target_windows = { vim.api.nvim_get_current_win() } })
        end)
    end,
}
