-- a main purpose of this plugin is to fix code folding in vscode
-- https://github.com/vscode-neovim/vscode-neovim/issues/58#issuecomment-1775424814
-- https://github.com/xiyaowong/fast-cursor-move.nvim/issues/2
return {
  "dgokcin/fast-cursor-move.nvim",
  event = "BufRead",
  vscode = true,
  config = function()
      vim.defer_fn(function()
          require("fast-cursor-move").setup({
              enable_acceleration = false,
          })
      end, 500)
  end,
}
