-- vim.cmd.syntax(true)

vim.opt.encoding = "UTF-8"
vim.opt.autoread = true
vim.opt.updatetime = 300
vim.opt.showmode = true
vim.opt.wildmenu = true
vim.opt.wildignorecase = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.swapfile = false
vim.opt.ignorecase = true
vim.opt.backup = false
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.scrolloff = 8
vim.opt.splitright = true
vim.opt.splitbelow = true

print("Set highlight extrawhitespace")
-- Tab Options
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.softtabstop = 0
vim.opt.expandtab = true

-- Set completeopt to have a better completion experience
vim.opt.completeopt = { "menuone", "noinsert", "noselect" }

-- Netrw options
vim.g.netrw_liststyle = 3
