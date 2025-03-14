local specs = {
	-- As with palettes, the values defined under `all` will be applied to every style.
	all = {
		syntax = {
			-- Specs allow you to define a value using either a color or template. If the string does
			-- start with `#` the string will be used as the path of the palette table. Defining just
			-- a color uses the base version of that color.
			keyword = "yellow",

			-- Adding either `.bright` will change the value
			conditional = "magenta.bright",
			number = "orange",
			func = "yellow",
			regex = "red",
			string = "green",
			builtin0 = "cyan",
			builtin1 = "white",
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
			variables = "yellow",
			string = "green",
			func = "yellow",
		},
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

				styles = {
					comments = "bold,italic", -- Value is any valid attr-list value `:help attr-list`
					functions = "italic",
					keywords = "bold",
					variables = "NONE",
					types = "italic,bold",
					strings = "NONE",
					constants = "bold",
				},
				specs = specs,
			},
			-- ...
		})

		vim.cmd("colorscheme github_dark_dimmed")
	end,
}
