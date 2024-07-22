local M = {
	"neanias/everforest-nvim",
	lazy = false,
	priority = 1000, -- make sure to load this before all the other start plugins
}

function M.config()
	local everforest = require("everforest")
	everforest.setup({
		background = "hard",
		transparent_background_level = 1,
		italics = true,
		disable_italic_comments = false,
		on_highlights = function(hl, _) end,
	})
	everforest.load()
end

return M
--
-- return {
-- 	{
-- 		"EdenEast/nightfox.nvim",
-- 		lazy = false,
-- 		priority = 1000,
-- 		config = function()
-- 			local palette = require("nightfox.palette").load("terafox")
-- 			require("nightfox").setup({
-- 				options = {
-- 					styles = {
-- 						comments = "italic",
-- 						conditionals = "bold",
-- 						functions = "italic",
-- 						keywords = "bold",
-- 					},
-- 					transparent = true,
-- 				},
-- 				groups = {
-- 					all = {
-- 						TelescopeBorder = { fg = palette.fg3 },
-- 					},
-- 					nightfox = {
-- 						Visual = { bg = palette.bg1 },
-- 					},
-- 				},
-- 			})
-- 			vim.cmd.colorscheme("terafox")
-- 		end,
-- 	},
-- }
