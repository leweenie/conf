vim.opt.completeopt = { 'menu', 'menuone', 'noselect' }
vim.opt.completefunc = 'syntaxcomplete#Complete'
vim.opt.number = true

-- vim.opt.list = true
-- vim.opt.listchars:append({ lead = '⋅' })

vim.opt.relativenumber = false
vim.opt.cmdheight = 1
vim.opt.numberwidth = 3
vim.opt.spelllang = "en"
vim.opt.cursorline = true
vim.opt.scrolloff = 10
vim.opt.laststatus = 3
vim.opt.hlsearch = false
vim.opt.fillchars:append({ eob = "~" })

vim.opt.wrap = true
vim.opt.linebreak = true
vim.opt.breakindent = true

vim.opt.splitright = true
vim.opt.splitbelow = true

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.autoindent = true

vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = true
vim.opt.incsearch = true

vim.opt.termguicolors = true
vim.opt.signcolumn = "yes"
vim.opt.colorcolumn = "110"
vim.opt.showmode = true

vim.opt.backspace = "indent,eol,start"
vim.opt.iskeyword:append("-")
vim.opt.clipboard:append("unnamedplus")
vim.opt.encoding = "UTF-8"
vim.opt.swapfile = false

vim.opt.wildmenu = true
vim.opt.wildignorecase = true
