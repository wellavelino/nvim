return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			local configs = require("nvim-treesitter.configs")

			configs.setup({
				ensure_installed = {
					"c",
					"lua",
					"rust",
					"vim",
					"html",
					"javascript",
					"typescript",
					"tsx",
					"json",
					"yaml",
					"toml",
					"go",
					"bash",
					"css",
					"scss",
					"dockerfile",
					"java",
					"elixir",
					"eex",
					"heex",
				},
				sync_install = false,
				auto_install = true,
				highlight = { enable = true },
				indent = { enable = true },
				rainbow = {
					enable = true,
					extended_mode = true,
					max_file_lines = nil,
				},
			})
		end,
	},
	"nvim-telescope/telescope-ui-select.nvim",
	config = function()
		require("telescope").setup({
			extensions = {
				["ui-select"] = {
					require("telescope.themes").get_dropdown({}),
				},
			},
		})
		require("telescope").load_extension("ui-select")
	end,
}
