vim.g.mapleader = " "
vim.g.maplocalleader = " "
local opts = { noremap = true, silent = true }
local map = vim.keymap.set

map("n", "<S-l>", ":bn<CR>", opts)
map("n", "<S-h>", ":bp<CR>", opts)

map("n", "<A-j>", ":m .+1<CR>==", opts)
map("n", "<A-k>", ":m .-2<CR>==", opts)
map("v", "<A-j>", ":m '>+1<CR>gv=gv", opts)
map("v", "<A-k>", ":m '<-2<CR>gv=gv", opts)

map("v", "<", "<gv", opts)
map("v", ">", ">gv", opts)

map("n", "<C-A-k>", ":horizontal resize +2<CR>", opts)
map("n", "<C-A-j>", ":horizontal resize -2<CR>", opts)
map("n", "<C-A-h>", ":vertical resize -2<CR>", opts)
map("n", "<C-A-l>", ":vertical resize +2<CR>", opts)

map("n", "<C-u>", "<C-u>zz", opts)
map("n", "<C-d>", "<C-d>zz", opts)

vim.keymap.set("n", "<leader>e", function()
    require("oil").open()
end)

map("n", "<C-n>", function()
    vim.diagnostic.jump({ count = 1, float = true })
end)
map("n", "<C-p>", function()
    vim.diagnostic.jump({ count = -1, float = true })
end)

map("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
map("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

map("n", "<leader>tp", ":TypstPreview<CR>", opts)

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

map('t', "<esc><esc>", "<C-\\><C-N>", opts)

local flag1 = true
map('n', "<C-S-Up>", function()
    flag1 = not flag1
    if flag1 then
        vim.opt.cmdheight = 1
    else
        vim.opt.cmdheight = 0
    end
end, opts)

map({ 'n', 'v' }, '<A-S-j>', ":t.<cr>", opts)

map('n', '<leader>u', ":UndotreeToggle<cr>", opts)

map('n', '<C-l>', ":noh<cr>", opts)

local flag2 = false
map('n', "<leader>ln", function()
    flag2 = not flag2
    if flag2 then
        vim.opt.number = false
    else
        vim.opt.number = true
    end
end, opts)

map('n', "<leader>bd", function()
    vim.cmd("bp | bd #")
end, opts)

local zoomed = false
map("n", "<leader>o", function()
    zoomed = not zoomed

    if zoomed then
        vim.cmd("wincmd _")
        vim.cmd("wincmd |")
    else
        vim.cmd("wincmd =")
    end
end, opts)

