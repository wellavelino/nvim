vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Add node_modules/.bin to PATH for claude-code-acp
local config_path = vim.fn.stdpath("config")
vim.env.PATH = config_path .. "/node_modules/.bin:" .. vim.env.PATH

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("options")
require("keymaps")
require("config.lsp")
require("lazy").setup("plugins")
