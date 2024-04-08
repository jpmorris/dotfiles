return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
    cond = function() return not vim.g.vscode end,
	config = function () 
		local configs = require("nvim-treesitter.configs")

		configs.setup({
			ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "elixir", "heex", "javascript", "html" },
			sync_install = false,
			highlight = { enable = true },
			indent = { enable = true },
		})
	end
}

