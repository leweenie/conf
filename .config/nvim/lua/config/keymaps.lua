vim.g.mapleader = " "
vim.g.maplocalleader = " "
local opts = { noremap = true, silent = true }
local map = vim.keymap.set

-- buffer navigation
map("n", "<S-l>", ":bn<CR>", opts)
map("n", "<S-h>", ":bp<CR>", opts)

-- text management
map("n", "<A-j>", ":m .+1<CR>==", opts)
map("n", "<A-k>", ":m .-2<CR>==", opts)
map("v", "<A-j>", ":m '>+1<CR>gv=gv", opts)
map("v", "<A-k>", ":m '<-2<CR>gv=gv", opts)

-- better indenting
map("v", "<", "<gv", opts)
map("v", ">", ">gv", opts)

-- window resize
map("n", "<C-A-k>", ":horizontal resize +2<CR>", opts)
map("n", "<C-A-j>", ":horizontal resize -2<CR>", opts)
map("n", "<C-A-h>", ":vertical resize -2<CR>", opts)
map("n", "<C-A-l>", ":vertical resize +2<CR>", opts)

-- buffer nav
map("n", "<C-u>", "<C-u>zz", opts)
map("n", "<C-d>", "<C-d>zz", opts)

-- oil
vim.keymap.set("n", "<leader>e", function()
    require("oil").open()
end)

-- cycle lsp diagnostics
map("n", "<C-n>", function()
    vim.diagnostic.jump({ count = 1, float = true })
end)
map("n", "<C-S-n>", function()
    vim.diagnostic.jump({ count = -1, float = true })
end)

-- navigating long warpped sentences / lines
map("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
map("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- close all
vim.cmd("cnoreabbrev q qa")

-- typst preview
map("n", "<leader>tp", ":TypstPreview<CR>", opts)

-- format buffer without saving
map("n", "<leader>bf", function()
    vim.lsp.buf.format({ async = true })
end, opts)

-- toggle lsp text
local text_on = false
map("n", "<leader>lt", function()
    text_on = not text_on
    vim.diagnostic.config({ virtual_text = text_on })
    if text_on then
        print("diagnostics on")
    else
        print("diagnostics off")
    end
end)

-- exit term mode
map('t', "<esc><esc>", "<C-\\><C-N>", opts)

-- toggle cmdheight
local flag = true
map('n', "<C-S-Up>", function()
    flag = not flag
    if flag then
        vim.opt.cmdheight = 1
    else
        vim.opt.cmdheight = 0
    end
end, opts)

-- duplicate line/selection down
map({ 'n', 'v' }, '<A-S-j>', ":t.<cr>", opts)

-- toggle undotree
map('n', '<leader>u', ":UndotreeToggle<cr>", opts)

-- clear hlsearch
map('n', '<C-l>', ":noh<cr>", opts)

-- toggle number
local flag = false
map('n', "<leader>ln", function()
    flag = not flag
    if flag then
        vim.opt.number = false
    else
        vim.opt.number = true
    end
end, opts)

-- toggle nvimtree
vim.keymap.set("n", "<C-p>", function()
    vim.cmd("NvimTreeFindFileToggle")
end, opts)
