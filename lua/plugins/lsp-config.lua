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
					"elixirls",
					"gopls",
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
			lspconfig.lua_ls.setup({
				capabilities = capabilities,
				autostart = true,
				settings = {
					Lua = {
						diagnostics = { globals = { "vim" } },
					},
				},
			})
			lspconfig.elixirls.setup({
				capabilities = capabilities,
			})

			lspconfig.gopls.setup({
				capabilities = capabilities,
			})
			lspconfig.rust_analyzer.setup({
				capabilities = capabilities,
			})
			lspconfig.htmx.setup({
				capabilities = capabilities,
			})

			-- nosure it will work
			vim.api.nvim_create_autocmd("LspAttach", {
				callback = function(args)
					local client = vim.lsp.get_client_by_id(args.data.client_id)

					if client ~= nil and client.supports_method("textDocument/formatting") then
						vim.api.nvim_create_autocmd("BufWritePre", {
							buffer = args.buf,
							callback = function()
								vim.lsp.buf.format({ bufnr = args.buf, id = client.id })
							end,
						})
					end
				end,
			})
		end,
	},

	{
		"mrcjkb/rustaceanvim",
		version = "^4", -- Recommended
		lazy = false, -- This plugin is already lazy
	},
	{
		"pmizio/typescript-tools.nvim",
		dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
		opts = {},
	},
}
