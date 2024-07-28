vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

--
vim.keymap.set("i", "jj", "<Esc>")
vim.keymap.set("i", "JJ", "<Esc>")

-- move lines in visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

 -- keep cursor in same place
vim.keymap.set("n", "J", "mzJ`z")
-- half page jumping cursor in middle
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
-- keep search page in the middle
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- paste over highlight without overwriting 
vim.keymap.set("x", "<leader>p", [["_dP]])

-- yank into system clipboard
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])
-- delete into system clipboard
vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])

-- disable Q
vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

-- quickfix navigation
--vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
--vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
--vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
--vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

-- replace word cursor is on
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

if (vim.g.vscode)
then
    local vscode = require('vscode-neovim')
    -- leader shortcuts not supported in vscode; shift shortcuts not supported in neovim
    vim.keymap.set("n", "<leader>qo", function() vscode.call('workbench.action.quickOpen') end)
    vim.keymap.set("n", "<leader>fr", function() vscode.call('references-view.findReferences') end)
    vim.keymap.set("n", "<leader>vp", function() vscode.call('workbench.actions.view.problems') end)
    vim.keymap.set("n", "<leader>gr", function() vscode.call('editor.action.goToReferences') end)
    vim.keymap.set("n", "<leader>fd", function() vscode.call('editor.action.formatDocument') end)
    vim.keymap.set("n", "<leader>ff", function() vscode.call('workbench.action.findInFiles') end)
    vim.keymap.set("n", "<leader>sc", function() vscode.call('workbench.action.showCommands') end)
    vim.keymap.set("n", "<leader>tp", function() vscode.call('workbench.action.togglePanel') end)
    vim.keymap.set("n", "<leader>tb", function() vscode.call('editor.debug.action.toggleBreakpoint') end)
    vim.keymap.set("v", "<leader>sc", function() vscode.call('editor.debug.action.selectionToRepl') end)
    vim.keymap.set("n", "<leader>sh", function() vscode.call('editor.debug.action.showDebugHover') end)
    vim.keymap.set("n", "<leader>gd", function() vscode.call('editor.action.revealDefinition') end)
    vim.keymap.set("n", "<leader>tf", function() vscode.call('editor.toggleFold') end)
    vim.keymap.set("n", "<leader>fa", function() vscode.call('editor.foldAll') end)
    vim.keymap.set("n", "<leader>ur", function() vscode.call('editor.unfoldRecursively') end)
    -- see ~/.config/Code/User/keybindings.json for extra mappings

    --
    -- run debug
    --
    -- open problems
    -- run selection in debug
end
