local indent = 2

vim.opt.autoread = true
vim.opt.autowrite = true
vim.opt.backspace = '2'
vim.opt.backup = false
vim.opt.breakindent = true
-- vim.opt.clipboard = "unnamedplus"
vim.opt.cmdheight = 2
vim.opt.colorcolumn = "99999"
vim.opt.completeopt = { "menuone", "noselect" }
vim.opt.conceallevel = 3
vim.opt.confirm = true
vim.opt.cursorcolumn = true
vim.opt.cursorline = true
vim.opt.expandtab = true
vim.opt.fileencoding = "utf-8"
vim.opt.foldcolumn = "1" -- '0' is not bad
vim.opt.foldenable = true
vim.opt.foldexpr = "nvim_treesitter#foldexpr()" -- set to "nvim_treesitter#foldexpr()" for treesitter based folding
vim.opt.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
vim.opt.foldlevelstart = 99
vim.opt.foldmethod = "manual" -- set to "expr" for treesitter based folding
vim.opt.guifont = "monospace:h17"
vim.opt.hidden = true -- help multiple buffers
vim.opt.hlsearch = true -- highlight searches
vim.opt.ignorecase = true -- search patterns
vim.opt.inccommand = "nosplit"
vim.opt.joinspaces = false
vim.opt.laststatus = 2
vim.opt.list = true
vim.opt.listchars:append("eol:↴")
-- vim.opt.listchars:append("space:⋅")
vim.opt.mouse = "a"
vim.opt.number = true
vim.opt.numberwidth = 3
vim.opt.pumblend = 10
vim.opt.pumheight = 15 -- pop up menu height
vim.opt.relativenumber = true
vim.opt.scrollback = 100000
vim.opt.scrolloff = 8
vim.opt.sessionoptions = { "buffers", "curdir", "tabpages", "winsize" }
vim.opt.shiftround = true
vim.opt.shiftwidth = 2
vim.opt.shortmess:append("c")
vim.opt.showcmd = true
vim.opt.showmode = true
vim.opt.showtabline = 2 -- show tabs
vim.opt.sidescrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.smartcase = true
vim.opt.smartindent = true
vim.opt.spell = false
vim.opt.spelllang = "en"
vim.opt.splitbelow = true
vim.opt.splitkeep = "screen"
vim.opt.splitright = true
vim.opt.swapfile = true
vim.opt.tabstop = 2
vim.opt.termguicolors = true
vim.opt.timeout = true
vim.opt.timeoutlen = 300
vim.opt.title = true
vim.opt.titlestring = "%<%F%=%l/%L - nvim"
vim.opt.undodir = vim.fn.stdpath("cache") .. "/undo"
vim.opt.undofile = true
vim.opt.updatetime = 300
vim.opt.wildmode = "longest:full,full"
vim.opt.wrap = false
vim.opt.writebackup = false

vim.g.mapleader = " "
vim.g.maplocalleader = ","

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.g.lazygit_floating_window_winblend = 10 -- transparency of floating window
vim.g.lazygit_floating_window_use_plenary = 1 -- use plenary.nvim to manage floating window if available
vim.g.lazygit_use_neovim_remote = 1 -- fallback to 0 if neovim-remote is not installed
vim.g.lazygit_use_custom_config_file_path = 0 -- config file path is evaluated if this value is 1
vim.g.lazygit_config_file_path = "" -- custom config file path
vim.g.lazygit_floating_window_corner_chars = { "╭", "╮", "╰", "╯" } -- customize lazygit popup window corner characters
vim.g.lazygit_floating_window_scaling_factor = 0.8 -- scaling factor for floating window

-- disable language provider support (lua and vimscript plugins only)
vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_node_provider = 0
vim.g.loaded_python_provider = 0
vim.g.loaded_python3_provider = 0

vim.o.formatoptions = "jcroqlnt"
vim.o.timeout = true
vim.o.timeoutlen = 300

vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

