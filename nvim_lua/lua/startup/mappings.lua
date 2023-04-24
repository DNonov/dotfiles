-- Remap the leader key
vim.g.mapleader = " "

-- Move faster
vim.keymap.set({"x", "n"}, "J", "5j")
vim.keymap.set({"x", "n"}, "K", "5k")

-- Jump throug splits
vim.keymap.set("n", "gh", "<C-w>h")
vim.keymap.set("n", "gj", "<C-w>j")
vim.keymap.set("n", "gk", "<C-w>k")
vim.keymap.set("n", "gl", "<C-w>l")

-- Faster inline select
vim.keymap.set("n", "vv", "_vg_")

-- Yank text to the clipboard
vim.keymap.set({"v", "n"}, "<leader>y", '"*Y')

-- Paste text to the clipboard
vim.keymap.set("n", "<leader>p", '"*p')

-- Moving lines up and down
vim.keymap.set("v", "<C-j>", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "<C-k>", ":m '>-2<CR>gv=gv")

-- Keep cursor at middle while jumping half screens
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Keep cursor at middle while jumping on search terms
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Mass replace
vim.keymap.set("n", "<leader>s", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left>")
