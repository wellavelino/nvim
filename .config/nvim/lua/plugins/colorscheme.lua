local specs = {
	all = {
		syntax = {
			-- Valid spec.syntax keys: bracket, builtin0, builtin1, builtin2, comment,
			-- conditional, const, dep, field, func, ident, keyword, number, operator,
			-- param, preproc, regex, statement, string, type, tag, variable
			conditional = "#b083f0",  -- purple/magenta bright
			builtin0 = "#ff9500",
			bracket = "#bcc2cc",
			keyword = "#9c0008",
		},
		git = {
			changed = "#bcc2cc",
		},
	},
}

local palettes = {
	github_dark_dimmed = {
		comment = "#636e7b",
	},
}

-- Treesitter highlight group overrides go here (not in specs)
local groups = {
	all = {
		["@keyword.conditional"] = { fg = "palette.magenta.bright" },
		["@keyword.conditional.ternary"] = { fg = "#d670d6" },
		["@function.builtin"] = { fg = "#ff9500" },
		["@function.method"] = { fg = "palette.yellow" },
		["@variable.builtin"] = { fg = "#8abeb7" },
		["@keyword.function"] = { fg = "#9c0008" },
		["@punctuation.bracket"] = { fg = "#bcc2cc" },
	},
}

return {
	"projekt0n/github-nvim-theme",
	name = "github-theme",
	lazy = false,
	priority = 2000,
	config = function()
		require("github-theme").setup({
			options = {
				transparent = true,
				dim_inactive = true,

				styles = {
					comments = "bold",
					functions = "NONE",
					keywords = "bold",
					variables = "NONE",
					types = "italic,bold",
					strings = "NONE",
					constants = "bold",
					operators = "bold",
				},
			},
			specs = specs,
			palettes = palettes,
			groups = groups,
		})

		vim.cmd.colorscheme({ args = { "github_dark_dimmed" } })
	end,
}
