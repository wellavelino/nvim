-- local M = {
-- 	"neanias/everforest-nvim",
-- 	lazy = false,
-- 	priority = 1000, -- make sure to load this before all the other start plugins
-- }
--
-- function M.config()
-- 	local everforest = require("everforest")
-- 	everforest.setup({
-- 		background = "soft",
-- 		transparent_background_level = 0.9,
-- 		italics = true,
-- 		disable_italic_comments = false,
-- 		highlight_groups = {
-- 			-- JavaScript highlights
-- 			["@variable.javascript"] = { italic = true },
-- 			["@function.javascript"] = { bold = true },
-- 			["@punctuation.bracket.javascript"] = { link = "Orange" },
-- 			["@variable.builtin.javascript"] = { bold = true },
--
-- 			-- Go (Golang) highlights
-- 			["@keyword.import.go"] = { link = "Aqua" },
-- 			["@variable.go"] = { link = "Orange" },
-- 			["@constant.go"] = { bold = true },
-- 			["@keyword.go"] = { italic = true },
-- 			["@type.go"] = { link = "Yellow" },
-- 			["@type.builtin.go"] = { link = "Yellow" },
--
-- 			-- You can add more custom highlights here
-- 		},
-- 	})
-- 	everforest.load()
-- end
--
-- return M
--
local specs = {
	-- As with palettes, the values defined under `all` will be applied to every style.
	all = {
		syntax = {
			-- Specs allow you to define a value using either a color or template. If the string does
			-- start with `#` the string will be used as the path of the palette table. Defining just
			-- a color uses the base version of that color.
			keyword = "magenta",

			-- Adding either `.bright` will change the value
			conditional = "magenta.bright",
			number = "orange",
		},
		git = {
			-- A color define can also be used
			changed = "#ffa261",
		},
	},
	github_dark_dimmed = {
		syntax = {
			-- As with palettes, a specific style's value will be used over the `all`'s value.
			operator = "orange",
		},
	},
}

return {
	"projekt0n/github-nvim-theme",
	name = "github-theme",
	lazy = false, -- make sure we load this during startup if it is your main colorscheme
	priority = 1000, -- make sure to load this before all the other start plugins
	config = function()
		require("github-theme").setup({
			options = {
				transparent = true,

				styles = {
					comments = "bold", -- Value is any valid attr-list value `:help attr-list`
					functions = "NONE",
					keywords = "bold",
					variables = "NONE",
				},
				specs = specs,
			},
			-- ...
		})

		vim.cmd("colorscheme github_dark_dimmed")
	end,
}
