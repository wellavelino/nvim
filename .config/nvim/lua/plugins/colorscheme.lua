-- Islands Dark (JetBrains) color palette
local islands = {
	fg        = "#bcbec4",
	keyword   = "#cf8e6d",
	string    = "#6aab73",
	comment   = "#7a7e85",
	func      = "#56a8f5",
	number    = "#2aacb8",
	constant  = "#c77dbb",
	interface = "#16baac",
	decorator = "#bbb529",
	error     = "#f75464",
}

local specs = {
	all = {
		syntax = {
			-- Valid spec.syntax keys: bracket, builtin0, builtin1, builtin2, comment,
			-- conditional, const, dep, field, func, ident, keyword, number, operator,
			-- param, preproc, regex, statement, string, type, tag, variable
			keyword     = islands.keyword,
			conditional = islands.keyword,
			statement   = islands.keyword,
			preproc     = islands.keyword,
			string      = islands.string,
			func        = islands.func,
			number      = islands.number,
			const       = islands.constant,
			field       = islands.constant,
			variable    = islands.fg,
			param       = islands.fg,
			type        = islands.fg,
			ident       = islands.fg,
			operator    = islands.fg,
			bracket     = islands.fg,
			regex       = islands.number,
			tag         = islands.interface,
			builtin0    = islands.keyword,
			builtin1    = islands.interface,
			builtin2    = islands.constant,
		},
		git = {
			changed = "#bcc2cc",
		},
	},
}

local palettes = {
	github_dark_dimmed = {
		comment = islands.comment,
	},
}

-- Treesitter highlight group overrides go here (not in specs)
local groups = {
	all = {
		-- Keywords
		["@keyword"]                     = { fg = islands.keyword },
		["@keyword.conditional"]         = { fg = islands.keyword },
		["@keyword.conditional.ternary"] = { fg = islands.keyword },
		["@keyword.function"]            = { fg = islands.keyword },
		["@keyword.import"]              = { fg = islands.keyword },
		["@keyword.return"]              = { fg = islands.keyword },
		["@keyword.operator"]            = { fg = islands.keyword },
		["@keyword.modifier"]            = { fg = islands.keyword },
		-- Functions
		["@function"]                    = { fg = islands.func },
		["@function.method"]             = { fg = islands.func },
		["@function.builtin"]            = { fg = islands.keyword, style = "italic" },
		["@function.call"]               = { fg = islands.func },
		["@function.method.call"]        = { fg = islands.func },
		-- Variables
		["@variable"]                    = { fg = islands.fg },
		["@variable.member"]             = { fg = islands.constant },
		["@variable.parameter"]          = { fg = islands.fg },
		["@variable.builtin"]            = { fg = islands.keyword, style = "italic" },
		-- Types
		["@type"]                        = { fg = islands.fg },
		["@type.builtin"]                = { fg = islands.keyword },
		["@type.definition"]             = { fg = islands.fg },
		-- Constants
		["@constant"]                    = { fg = islands.constant },
		["@constant.builtin"]            = { fg = islands.keyword },
		["@constant.macro"]              = { fg = islands.keyword },
		-- Strings
		["@string"]                      = { fg = islands.string },
		["@string.escape"]               = { fg = islands.keyword },
		["@string.special"]              = { fg = islands.keyword },
		["@string.regexp"]               = { fg = islands.number },
		-- Numbers / booleans
		["@number"]                      = { fg = islands.number },
		["@number.float"]                = { fg = islands.number },
		["@boolean"]                     = { fg = islands.keyword },
		-- Comments
		["@comment"]                     = { fg = islands.comment, style = "italic" },
		["@comment.documentation"]       = { fg = "#5f826b", style = "italic" },
		-- Punctuation
		["@punctuation.bracket"]         = { fg = islands.fg },
		["@punctuation.delimiter"]       = { fg = islands.fg },
		["@punctuation.special"]         = { fg = islands.keyword },
		-- Misc
		["@attribute"]                   = { fg = islands.decorator },
		["@tag"]                         = { fg = islands.interface },
		["@tag.attribute"]               = { fg = islands.fg },
		["@constructor"]                 = { fg = islands.func },
		["@operator"]                    = { fg = islands.fg },
		["@property"]                    = { fg = islands.constant },
		["@namespace"]                   = { fg = islands.fg },
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
					comments = "italic",
					functions = "NONE",
					keywords = "NONE",
					variables = "NONE",
					types = "NONE",
					strings = "NONE",
					constants = "italic",
					operators = "NONE",
				},
			},
			specs = specs,
			palettes = palettes,
			groups = groups,
		})

		vim.cmd.colorscheme({ args = { "github_dark_dimmed" } })
	end,
}
