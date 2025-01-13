return {
	{
		"mbbill/undotree",
		cmd = "UndotreeToggle", -- Lazy load when the command is used
		config = function()
			-- Configuration settings for undotree
			vim.g.undotree_SplitWidth = 30
			vim.g.undotree_SetFocusWhenToggle = 1
			vim.g.undotree_WindowLayout = 3
		end,
	},
}
