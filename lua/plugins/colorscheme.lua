local M = {
	"neanias/everforest-nvim",
	lazy = false,
	priority = 1000, -- make sure to load this before all the other start plugins
}

function M.config()
	local everforest = require("everforest")
	everforest.setup({
		background = "hard",
		transparent_background_level = 3,
		italics = true,
		disable_italic_comments = false,
		highlight_groups = {
			-- JavaScript highlights
			["@variable.javascript"] = { italic = true },
			["@function.javascript"] = { bold = true },
			["@punctuation.bracket.javascript"] = { link = "Orange" },
			["@variable.builtin.javascript"] = { bold = true },

			-- Go (Golang) highlights
			["@keyword.import.go"] = { link = "Aqua" },
			["@variable.go"] = { link = "Orange" },
			["@constant.go"] = { bold = true },
			["@keyword.go"] = { italic = true },
			["@type.go"] = { link = "Yellow" },
			["@type.builtin.go"] = { link = "Yellow" },

			-- You can add more custom highlights here
		},
	})
	everforest.load()
end

return M
