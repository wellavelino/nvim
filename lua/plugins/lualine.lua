-- Status line
return {
	-- https://github.com/nvim-lualine/lualine.nvim
	"nvim-lualine/lualine.nvim",
	dependencies = {
		-- https://github.com/nvim-tree/nvim-web-devicons
		"nvim-tree/nvim-web-devicons", -- fancy icons
		-- https://github.com/linrongbin16/lsp-progress.nvim
		"linrongbin16/lsp-progress.nvim", -- LSP loading progress
	},
	opts = {
		options = {
			theme = "codedark",
		},
		sections = {
			lualine_c = {
				{
					-- Customize the filename part of lualine to be parent/filename
					"filename",
					file_status = true, -- Displays file status (readonly status, modified status)
					newfile_status = false, -- Display new file status (new file means no write after created)
					path = 4, -- 0: Just the filename
					-- 1: Relative path
					-- 2: Absolute path
					-- 3: Absolute path, with tilde as the home directory
					-- 4: Filename and parent dir, with tilde as the home directory
					symbols = {
						modified = "[+]", -- Text to show when the file is modified.
						readonly = "[-]", -- Text to show when the file is non-modifiable or readonly.
					},
				},
			},
		},
	},
}
--
-- local config = function()
-- 	local palette = require("nightfox.palette").load("terafox")
-- 	local custom_nightfox = require("lualine.themes.nightfox")
-- 	custom_nightfox.normal.b.bg = palette.bg0
--
-- 	require("lualine").setup({
-- 		options = {
-- 			theme = custom_nightfox,
-- 			globalstatus = true,
-- 			component_separators = { left = "|", right = "|" },
-- 			section_separators = { left = "", right = "" },
-- 		},
-- 		sections = {
-- 			lualine_a = { "mode" },
-- 			lualine_b = { "buffers" },
-- 			lualine_x = { "encoding", "fileformat", "filetype", "progress" },
-- 			lualine_y = { "" },
-- 			lualine_z = { "location" },
-- 		},
-- 		tabline = {},
-- 	})
-- end
--
-- return {
-- 	"nvim-lualine/lualine.nvim",
-- 	lazy = false,
-- 	config = config,
-- }
