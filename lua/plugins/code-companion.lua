return {
	"olimorris/codecompanion.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
	},
	config = function()
		require("codecompanion").setup({
			strategies = {
				chat = {
					adapter = "copilot",
				},
				inline = {
					adapter = "copilot",
				},
			},
			-- extensions = {
			-- 	vectorcode = {
			-- 		opts = {
			-- 			add_tool = true,
			-- 		},
			-- 	},
			-- },
		})

		vim.keymap.set({ "n", "v" }, "<C-a>", require("codecompanion").actions, { noremap = true, silent = true })
		vim.keymap.set({ "n", "v" }, "<leader>ca", require("codecompanion").toggle, { noremap = true, silent = true })
		vim.keymap.set("v", "ga", require("codecompanion").add, { noremap = true, silent = true })

		-- Expand 'cc' into 'CodeCompanion' in the command line
		vim.cmd([[cab cc CodeCompanion]])
	end,
}
