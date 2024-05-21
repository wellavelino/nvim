return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
  opts = {
    filesystem = {
      filtered_items = {
	        visible = true,
	        show_hidden_count = true,
	        hide_dotfiles = false,
	         hide_gitignored = true
      }
     }
  },
  config = function()
		vim.keymap.set("n", "<C-n>", ":Neotree filesystem reveal left<CR>", {})
		vim.keymap.set("n", "<leader>bf", ":Neotree buffers reveal float<CR>", {})
    vim.keymap.set("n", "<C-gs>", ":Neotree float git_status", {})
    vim.keymap.set('n', '<C-t>', '<Cmd>Neotree toggle<CR>')
	end,
}
