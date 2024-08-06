-- seems that these currently break 'o' in vscode (doesnt move to line below)
if not (vim.g.vscode)
then
    vim.opt.nu = true
    vim.opt.relativenumber = true
end

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.foldmethod = "indent"
vim.opt.foldlevelstart = 99

vim.opt.smartindent = true
vim.opt.smartcase = true

vim.opt.ignorecase = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.colorcolumn = "80"
