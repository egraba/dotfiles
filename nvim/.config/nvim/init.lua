-- ~/.config/nvim/init.lua
-- Minimal configuration, no plugins. Tuned for C in BSD style (style(9) / KNF).

local opt = vim.opt

-- Theme -----------------------------------------------------------------
opt.background = "dark"
vim.cmd.colorscheme("sorbet")

-- Display ---------------------------------------------------------------
opt.number = true            -- line numbers
opt.ruler = true
opt.scrolloff = 4            -- keep 4 lines visible around the cursor
opt.wrap = false             -- do not wrap long lines
opt.colorcolumn = "81"       -- mark the 80-column limit
opt.list = true              -- show tabs and trailing whitespace
opt.listchars = { tab = "> ", trail = "~" }

-- Indentation: tabs of width 8 (KNF) ------------------------------------
opt.tabstop = 8
opt.shiftwidth = 8
opt.softtabstop = 8
opt.expandtab = false        -- real tabs (also required by Makefiles)

-- Search ----------------------------------------------------------------
opt.ignorecase = true
opt.smartcase = true         -- case-sensitive if the pattern has a capital
opt.hlsearch = true
opt.incsearch = true

-- Windows ---------------------------------------------------------------
opt.splitright = true
opt.splitbelow = true

-- Files -----------------------------------------------------------------
opt.undofile = true          -- keep undo history between sessions
opt.swapfile = false         -- no .swp files cluttering project directories
opt.hidden = true            -- allow switching buffers with unsaved changes

-- Treat .h files as C, not C++
vim.g.c_syntax_for_h = 1

-- C: style(9) -----------------------------------------------------------
-- textwidth 80, C-aware indenting, 4-space continuation lines,
-- case labels aligned with switch, return type on its own line.
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "c", "cpp" },
	callback = function()
		vim.bo.cindent = true
		vim.bo.textwidth = 80
		vim.bo.cinoptions = ":0,t0,+4,(4,u4"
		vim.bo.formatoptions = "croql"
	end,
})

-- Mail/text commit messages: wrap at 72
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "gitcommit", "mail" },
	callback = function()
		vim.bo.textwidth = 72
	end,
})

-- Keymaps ---------------------------------------------------------------
-- Clear search highlighting with Esc
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", { silent = true })
