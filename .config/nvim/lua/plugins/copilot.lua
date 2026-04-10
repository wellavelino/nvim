return {
	"zbirenbaum/copilot.lua",
	cmd = "Copilot",
	event = "InsertEnter",
	config = function()
		require("copilot").setup({
			copilot_model = "gpt-5-copilot",
			auth_provider_url = "https://code.devsnc.com",
		})

		vim.api.nvim_set_hl(0, "CopilotSuggestion", {
			fg = "#FFFFFF",
			bold = true,
		})
	end,
}
