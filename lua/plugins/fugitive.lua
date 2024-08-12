return {
	"tpope/vim-fugitive",
	event = "VeryLazy",
	config = function()
		-- Existing key mappings
		vim.keymap.set("n", "<leader>gs", vim.cmd.Git, { desc = "Git status" })
		vim.keymap.set("n", "<leader>gc", ":Git commit<CR>", { desc = "Git commit" })
		vim.keymap.set("n", "<leader>gb", ":Git blame<CR>", { desc = "Git blame" })

		-- Interactive merge mappings
		vim.keymap.set("n", "<leader>gm", ":Gvdiffsplit!<CR>", { desc = "Git interactive merge" })
		vim.keymap.set("n", "<leader>gh", ":diffget //2<CR>", { desc = "Get diff from left (target branch)" })
		vim.keymap.set("n", "<leader>gl", ":diffget //3<CR>", { desc = "Get diff from right (merge branch)" })
		vim.keymap.set("n", "<leader>gu", ":diffupdate<CR>", { desc = "Update diff" })

		-- Optional: Set up autocommands
		vim.api.nvim_create_autocmd("FileType", {
			pattern = "fugitive",
			callback = function()
				-- Local buffer mappings for fugitive buffers
				vim.keymap.set("n", "q", ":close<CR>", { buffer = true })
			end,
		})

		-- Helper function for interactive merge
		local function merge_conflict_resolution()
			print("Interactive Merge Conflict Resolution:")
			print("  <leader>gm : Start interactive merge")
			print("  <leader>gh : Get diff from left (target branch)")
			print("  <leader>gl : Get diff from right (merge branch)")
			print("  <leader>gu : Update diff")
			print("  :w         : Save changes")
			print("  :wqa       : Save all changes and exit")
		end

		vim.api.nvim_create_user_command(
			"MergeHelp",
			merge_conflict_resolution,
			{ desc = "Show merge conflict resolution help" }
		)
	end,
}
