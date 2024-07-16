return {
	{
		"williamboman/mason.nvim",
		lazy = false,
		config = function()
			require("mason").setup({
				ui = {
					icons = {
						package_installed = "✓",
						package_pending = "➜",
						package_uninstalled = "✗",
					},
				},
				opts = { ensure_installed = { "prettier" } },
			})
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		lazy = false,
		opts = {
			auto_install = true,
		},
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"htmx",
					"jsonls",
					"tsserver",
					"yamlls",
					"dockerls",
					"eslint",
					"elixirls",
					"gopls",
					"graphql",
					"pylsp",
					"rust_analyzer",
					"lua_ls",
				},
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			local lspconfig = require("lspconfig")
			lspconfig.tsserver.setup({
				capabilities = capabilities,
			})
			lspconfig.lua_ls.setup({
				capabilities = capabilities,
				autostart = true,
				settings = {
					Lua = {
						diagnostics = { globals = { "vim" } },
					},
				},
			})
			lspconfig.jsonls.setup({
				capabilities = capabilities,
			})

			lspconfig.yamlls.setup({
				capabilities = capabilities,
			})

			lspconfig.dockerls.setup({
				capabilities = capabilities,
			})

			lspconfig.eslint.setup({
				capabilities = capabilities,
				settings = {
					format = false,
					lint = true,
					lintFiletypes = { "javascript", "typescript", "typescriptreact", "javascriptreact" },
					rootPatterns = { ".eslintrc.json", ".eslintrc.js", ".eslintrc", ".eslintignore" },
				},
				on_attach = function(client, bufnr)
					vim.api.nvim_create_autocmd("BufWritePre", {
						buffer = bufnr,
						command = "EslintFixAll",
					})
				end,
			})

			lspconfig.elixirls.setup({
				capabilities = capabilities,
			})

			lspconfig.gopls.setup({
				capabilities = capabilities,
			})

			lspconfig.graphql.setup({
				capabilities = capabilities,
			})

			lspconfig.pylsp.setup({
				capabilities = capabilities,
			})

			lspconfig.rust_analyzer.setup({
				capabilities = capabilities,
			})

			lspconfig.htmx.setup({
				capabilities = capabilities,
			})
		end,
	},
	{
		"mrcjkb/rustaceanvim",
		version = "^4", -- Recommended
		lazy = false, -- This plugin is already lazy
	},
}
