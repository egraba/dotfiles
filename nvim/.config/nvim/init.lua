-- ============================================================
--  Neovim configuration — Lua + lazy.nvim
-- ============================================================

-- Leader must be set before plugins
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Load core config
require("config.lazy")    -- plugin manager bootstrap + setup
require("config.options") -- editor options
require("config.keymaps") -- key mappings
require("config.autocmds") -- autocommands
