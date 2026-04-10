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
					"gopls",
					"lua_ls",
					-- "eslint",
				},
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			{ "saghen/blink.cmp" },
		},
		lazy = false,
		config = function()
			local capabilities = require("blink.cmp").get_lsp_capabilities()
			local lsp_utils = require("config.lsp")

			vim.lsp.config("lua_ls", {
				capabilities = capabilities,
				autostart = true,
				on_attach = lsp_utils.on_attach,
				settings = {
					Lua = {
						diagnostics = { globals = { "vim" } },
					},
				},
			})

			-- Setup Go LSP
			vim.lsp.config("gopls", {
				capabilities = capabilities,
				autostart = true,
				on_attach = lsp_utils.on_attach,
			})

			-- To migrate ESLint, uncomment and use:
			-- vim.lsp.config("eslint", {
			-- 	capabilities = capabilities,
			-- 	on_attach = on_attach,
			-- 	settings = {
			-- 		eslint = {
			-- 			enable = true,
			-- 			run = "onType",
			-- 			useESLintClass = true,
			-- 			codeAction = {
			-- 				disableRuleComment = {
			-- 					enable = true,
			-- 					location = "separateLine",
			-- 				},
			-- 				showDocumentation = {
			-- 					enable = true,
			-- 				},
			-- 			},
			-- 			codeActionOnSave = {
			-- 				enable = false,
			-- 				mode = "problems",
			-- 			},
			-- 			format = false,
			-- 			nodePath = "",
			-- 			workingDirectory = { mode = "location" },
			-- 		},
			-- 	},
			-- })
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
		opts = {
			-- TypeScript Tools configuration
			settings = {
				-- TSServer plugin options
				tsserver_plugins = {},

				-- https://github.com/microsoft/TypeScript/blob/v5.0.4/src/server/protocol.ts#L3439
				-- tsserver_file_preferences = {
				-- 	includeInlayParameterNameHints = "literals", -- Show parameter name hints (all, literals, none)
				-- 	includeInlayParameterNameHintsWhenArgumentMatchesName = true,
				-- 	includeInlayVariableTypeHints = true, -- Show variable type hints
				-- 	includeInlayPropertyDeclarationTypeHints = true, -- Show property declaration type hints
				-- 	includeInlayFunctionLikeReturnTypeHints = false, -- Show return type hints
				-- 	includeInlayEnumMemberValueHints = false, -- Show enum value hints
				-- },
				--
				tsserver_file_preferences = {
					-- Show parameter names for literal arguments (like strings, numbers, booleans).
					-- This is the most useful hint, clarifying calls like `doSomething(true, false)`.
					includeInlayParameterNameHints = "literals",

					-- Don't show the parameter name if your variable name already matches.
					-- This reduces noise, e.g., in `login(user, user)`.
					includeInlayParameterNameHintsWhenArgumentMatchesName = false,

					-- Show the inferred type for variables. This can be very helpful but is
					-- a matter of personal taste. Set to `false` if you find it too noisy.
					includeInlayVariableTypeHints = true,

					-- The following hints are often less critical and can create more clutter.
					includeInlayPropertyDeclarationTypeHints = false,
					includeInlayFunctionLikeReturnTypeHints = false,
				},

				-- Enable strict checking in the compiler options
				-- https://github.com/microsoft/TypeScript/blob/v5.0.4/src/server/protocol.ts#L3418
				tsserver_format_options = {},

				-- Complete function calls with parameter placeholders
				complete_function_calls = true,
			},

			-- Set up missing parameter diagnostics
			tsserver_flags = {
				["--noImplicitAny"] = true,
				["--strictFunctionTypes"] = true,
				["--strictNullChecks"] = true,
				["--strict"] = true,
			},

			-- Get immediate diagnostics as you type
			publish_diagnostic_on = "change",

			-- Enable highlighting for missing parameters
			handlers = {
				["textDocument/publishDiagnostics"] = function(err, result, ctx, config)
					if result.diagnostics == nil then
						result.diagnostics = {}
					end

					-- Forward diagnostics to Neovim's diagnostic system
					vim.lsp.handlers["textDocument/publishDiagnostics"](err, result, ctx, config)
				end,
			},

			on_attach = function(client, bufnr)
				require("config.lsp").on_attach(client, bufnr)
			end,
		},
	},
}
