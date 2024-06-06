return {
	"nvimtools/none-ls.nvim",
	 dependencies = {
      "nvimtools/none-ls-extras.nvim",
    },

  config = function()
		local null_ls = require("null-ls")
		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.stylua,
				null_ls.builtins.formatting.prettier,
				null_ls.builtins.diagnostics.erb_lint,
				null_ls.builtins.diagnostics.rubocop,
				null_ls.builtins.formatting.rubocop,
        require("none-ls.diagnostics.eslint"),
        null_ls.builtins.completion.luasnip ,
        null_ls.builtins.code_actions.refactoring,
			},
		})

		
	end,
}
