return {
	"zbirenbaum/copilot.lua",
	cmd = "Copilot",
	event = "InsertEnter",
	config = function()
		require("copilot").setup({
			-- Your existing model setting
			copilot_model = "gpt-4o-copilot",
		})

		-- --- Set the suggestion color (as before) ---
		vim.api.nvim_set_hl(0, "CopilotSuggestion", {
			fg = "#FFFFFF",
			bold = true,
		})
	end,
}
