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
					"eslint",
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
			lspconfig.gopls.setup({
				capabilities = capabilities,
			})

			lspconfig.eslint.setup({
				capabilities = capabilities,
				on_attach = function(client, bufnr)
					-- Enable diagnostics for the buffer
					vim.diagnostic.enable(bufnr)

					-- Configure diagnostic display
					vim.diagnostic.config({
						virtual_text = true,
						signs = true,
						underline = true,
						update_in_insert = false,
						severity_sort = true,
					})
				end,
				settings = {
					eslint = {
						enable = true,
						run = "onType", -- Run ESLint on every keystroke
						-- This won't override your .eslintrc.js settings, but adds additional configuration
						-- Note: The actual rules should be defined in your project's .eslintrc.js
						useESLintClass = true,
						codeAction = {
							disableRuleComment = {
								enable = true,
								location = "separateLine",
							},
							showDocumentation = {
								enable = true,
							},
						},
						codeActionOnSave = {
							enable = false, -- Don't auto-fix on save
							mode = "problems",
						},
						format = false, -- Don't use ESLint for formatting
						nodePath = "", -- Use this if your ESLint is installed in a non-standard location
						workingDirectory = { mode = "location" },
					},
				},
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
		opts = {
			-- TypeScript Tools configuration
			settings = {
				-- TSServer plugin options
				tsserver_plugins = {},

				-- https://github.com/microsoft/TypeScript/blob/v5.0.4/src/server/protocol.ts#L3439
				tsserver_file_preferences = {
					includeInlayParameterNameHints = "literals", -- Show parameter name hints (all, literals, none)
					includeInlayParameterNameHintsWhenArgumentMatchesName = true,
					includeInlayVariableTypeHints = true, -- Show variable type hints
					includeInlayPropertyDeclarationTypeHints = true, -- Show property declaration type hints
					includeInlayFunctionLikeReturnTypeHints = false, -- Show return type hints
					includeInlayEnumMemberValueHints = false, -- Show enum value hints
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

			-- Custom on_attach function to enable additional features
			on_attach = function(client, bufnr)
				-- Enable inlay hints if available
				if client.server_capabilities.inlayHintProvider then
					vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
				end

				-- Set up diagnostics configuration for better visibility
				vim.diagnostic.config({
					virtual_text = {
						prefix = "●", -- Use a dot as prefix for virtual text
						source = "if_many",
					},
					float = {
						source = "always",
						border = "rounded",
					},
					signs = true,
					underline = true,
					update_in_insert = false,
					severity_sort = true,
				})

				-- Optional: Set up signs for different diagnostic levels
				vim.fn.sign_define("DiagnosticSignError", { text = "✗", texthl = "DiagnosticSignError" })
				vim.fn.sign_define("DiagnosticSignWarn", { text = "⚠", texthl = "DiagnosticSignWarn" })
				vim.fn.sign_define("DiagnosticSignInfo", { text = "ℹ", texthl = "DiagnosticSignInfo" })
				vim.fn.sign_define("DiagnosticSignHint", { text = "➤", texthl = "DiagnosticSignHint" })
			end,
		},
	},
}
