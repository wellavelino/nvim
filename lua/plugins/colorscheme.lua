local specs = {
	-- As with palettes, the values defined under `all` will be applied to every style.
	all = {
		syntax = {
			["keyword.conditional"] = "magenta.bright",
			["keyword.conditional.ternary"] = "#d670d6", -- Ternary operators specifically
			["function.builtin"] = "#ff9500", -- Change to your preferred color
			["function.method"] = "yellow",
			["variable.builtin"] = { fg = "#8abeb7" }, -- Built-in variables like 'self', 'this'
			["keyword.function"] = "#9c0008", -- Function definition keywords:with
			["punctuation.bracket"] = { fg = "#bcc2cc" }, -- Brackets
		},
		git = {
			-- A color define can also be used
			changed = "#bcc2cc", -- semi white
		},
	},
}

local palettes = {
	github_dark_dimmed = {
		-- comment is the definition of the comment color.
		comment = "#636e7b",
	},
}

return {
	"projekt0n/github-nvim-theme",
	name = "github-theme",
	lazy = false, -- make sure we load this during startup if it is your main colorscheme
	priority = 2000, -- make sure to load this before all the other start plugins
	config = function()
		require("github-theme").setup({
			options = {
				transparent = true,
				dim_inactive = true,

				styles = {
					comments = "bold", -- Value is any valid attr-list value `:help attr-list`
					functions = "NONE",
					keywords = "bold",
					variables = "NONE",
					types = "italic,bold",
					strings = "italic",
					constants = "bold",
					operators = "bold",
				},
				specs = specs,
				palettes = palettes,
			},
		})

		vim.cmd.colorscheme({ args = { "github_dark_dimmed" } })
	end,
}
