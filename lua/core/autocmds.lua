-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank()
	end,
	group = highlight_group,
	pattern = "*",
})

-- Check if we need to reload the file when it changed
vim.api.nvim_create_autocmd("FocusGained", { command = "checktime" })

-- go to last loc when opening a buffer
vim.api.nvim_create_autocmd("BufReadPost", {
	callback = function()
		local mark = vim.api.nvim_buf_get_mark(0, '"')
		local lcount = vim.api.nvim_buf_line_count(0)
		if mark[1] > 0 and mark[1] <= lcount then
			pcall(vim.api.nvim_win_set_cursor, 0, mark)
		end
	end,
})

-- Auto toggle hlsearch
local ns = vim.api.nvim_create_namespace("toggle_hlsearch")
local function toggle_hlsearch(char)
	if vim.fn.mode() == "n" then
		local keys = { "<CR>", "n", "N", "*", "#", "?", "/" }
		local new_hlsearch = vim.tbl_contains(keys, vim.fn.keytrans(char))

		if vim.opt.hlsearch:get() ~= new_hlsearch then
			vim.opt.hlsearch = new_hlsearch
		end
	end
end
vim.on_key(toggle_hlsearch, ns)

-- windows to close
vim.api.nvim_create_autocmd("FileType", {
	pattern = {
		"OverseerForm",
		"OverseerList",
		"checkhealth",
		"floggraph",
		"fugitive",
		"git",
		"help",
		"lspinfo",
		"man",
		"neotest-output",
		"neotest-summary",
		"qf",
		"query",
		"spectre_panel",
		"startuptime",
		"toggleterm",
		"tsplayground",
		"vim",
	},
	callback = function(event)
		vim.bo[event.buf].buflisted = false
		vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true })
	end,
})

-- Hightlights for Indent Blank Lines Plugin
vim.cmd([[highlight IndentBlanklineIndent0 guifg=#99999 gui=nocombine]])
vim.cmd([[highlight IndentBlanklineIndent1 guifg=#99999 gui=nocombine]])
vim.cmd([[highlight IndentBlanklineIndent2 guifg=#99999 gui=nocombine]])
vim.cmd([[highlight IndentBlanklineIndent3 guifg=#99999 gui=nocombine]])
vim.cmd([[highlight IndentBlanklineIndent4 guifg=#99999 gui=nocombine]])
vim.cmd([[highlight IndentBlanklineIndent5 guifg=#99999 gui=nocombine]])
vim.cmd([[highlight IndentBlanklineIndent6 guifg=#99999 gui=nocombine]])
vim.cmd([[highlight IndentBlanklineIndent7 guifg=#99999 gui=nocombine]])
vim.cmd([[highlight IndentBlanklineIndent8 guifg=#99999 gui=nocombine]])
vim.cmd([[highlight IndentBlanklineIndent9 guifg=#99999 gui=nocombine]])

-- Hightlights for Hop vim.cmd("hi HopNextKey guifg=#FF9900")
vim.cmd("hi HopNextKey1 guifg=#FF9900")
vim.cmd("hi HopNextKey2 guifg=#FF9900")

vim.api.nvim_create_autocmd("BufEnter", { command = ":lua require('lazygit.utils').project_root_dir()" })


-- Copilot Suggestion Color
vim.cmd([[highlight CopilotSuggestions guifg=#55555 ctermfg=8 gui=nocombine]])

-- Format on Write
vim.cmd [[autocmd BufWritePre <buffer> lua vim.lsp.buf.format()]]
