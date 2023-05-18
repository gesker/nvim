-- Modes:
-- normal n
-- insert i
-- visual v
-- visual block x,
-- term t
-- command c

-- Keys
-- CR --> Carriage Rfturn
-- Space --> Space Bar
-- S --> Space
-- C --> Control
-- A --> Option

local kmap = vim.api.nvim_set_keymap

-- Leader Key is Space Bar
kmap("", "<Space>", "<Nop>", { desc = "Leader Key", noremap = true, silent = true })
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Buffers
kmap("n", "<C-S-j>", ":bprevious<CR>", { desc = "Buffer Previous", noremap = true, silent = true })
kmap("n", "<C-S-k>", ":bnext<CR>", { desc = "Buffer Next", noremap = true, silent = true })
kmap("n", "<C-S-l>", ":new<CR>", { desc = "Buffer New", noremap = true, silent = true })

-- Navigate Windows using Ctrl + h,j,k,l
kmap("n", "<C-h>", "<C-w>h", { desc = "Left Window Navigate", noremap = true, silent = true })
kmap("n", "<C-j>", "<C-w>j", { desc = "Up Window Navigate", noremap = true, silent = true })
kmap("n", "<C-k>", "<C-w>k", { desc = "Down Window Navigate", noremap = true, silent = true })
kmap("n", "<C-l>", "<C-w>l", { desc = "Right Window Navigate", noremap = true, silent = true })

-- Window Resize Using Arrow Keys
kmap("n", "<A-Left>", ":vertical resize -2<CR>", { desc = "Resize Window Left", noremap = true, silent = true })
kmap("n", "<A-Up>", ":resize -2<CR>", { desc = "Resize Window Up", noremap = true, silent = true })
kmap("n", "<A-Down>", ":resize +2<CR>", { desc = "Resize Window Down", noremap = true, silent = true })
kmap("n", "<A-Right>", ":vertical resize +2<CR>", { desc = "Resize Window Right", noremap = true, silent = true })

-- Split
-- kmap("n", "<leader>so", "<C-w>v", { desc = "Split Window Vertically", noremap = true, silent = true })
kmap("n", "<leader>sv", "<C-w>v", { desc = "Split Window Vertically", noremap = true, silent = true })
kmap("n", "<leader>sh", "<C-w>s", { desc = "Split Windows Horizontally", noremap = true, silent = true })
kmap("n", "<leader>se", "<C-w>=", { desc = "Split Windows Equally", noremap = true, silent = true })
kmap("n", "<leader>sc", ":close<CR>", { desc = "Split Close", noremap = true, silent = true })

-- Tabs
kmap("n", "<leader>bo", ":enew<CR>", { desc = "Buffer Open New", noremap = true, silent = true })
kmap("n", "<leader>bn", ":bnext<CR>", { desc = "Buffer Next", noremap = true, silent = true })
kmap("n", "<leader>bp", ":bprevious<CR>", { desc = "Buffer Previous", noremap = true, silent = true })
kmap("n", "<leader>bc", ":bdelete<CR>", { desc = "Buffer Close", noremap = true, silent = true })

-- Navigate Terminal
kmap("t", "<C-h>", "<C-\\><C-N><C-w>h", { desc = "Terminal Left", noremap = true, silent = true })
kmap("t", "<C-j>", "<C-\\><C-N><C-w>j", { desc = "Terminal Up", noremap = true, silent = true })
kmap("t", "<C-k>", "<C-\\><C-N><C-w>k", { desc = "Terminal Down", noremap = true, silent = true })
kmap("t", "<C-l>", "<C-\\><C-N><C-w>l", { desc = "Terminal Right", noremap = true, silent = true })

-- Fast in/out of isert/visual modes
kmap("i", "jk", "<ESC>", { desc = "Fast In/Out Visual Mode", noremap = true, silent = true })
kmap("i", "kj", "<ESC>", { desc = "Fast In/Out Visual Mode", noremap = true, silent = true })

-- Stay in indent mode
kmap("v", "<", "<gv", { desc = "Indent Left", noremap = true, silent = true })
kmap("v", ">", ">gv", { desc = "Indent Right", noremap = true, silent = true })

-- Move Text
kmap("n", "<A-j>", "<Esc>:m .+1<CR>==gi", { desc = "Move Text Up", noremap = true, silent = true })
kmap("n", "<A-k>", "<Esc>:m .-2<CR>==gi", { desc = "Move Text Down", noremap = true, silent = true })
kmap("v", "<A-j>", ":m .+1<CR>==", { desc = "Move Text Up", noremap = true, silent = true })
kmap("v", "<A-k>", ":m .-2<CR>==", { desc = "Move Text Down", noremap = true, silent = true })
kmap("v", "p", '"_dP', { desc = "Move Text", noremap = true, silent = true })
kmap("x", "<A-j>", ":move '>+1<CR>gv-gv", { desc = "Move Text Up", noremap = true, silent = true })
kmap("x", "<A-k>", ":move '<-2<CR>gv-gv", { desc = "Move Text Down", noremap = true, silent = true })
kmap("x", "J", ":move '>+1<CR>gv-gv", { desc = "Indent Up", noremap = true, silent = true })
kmap("x", "K", ":move '<-2<CR>gv-gv", { desc = "Indent Down", noremap = true, silent = true })
