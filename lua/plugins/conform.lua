return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },

	config = function()
		-- https://github.com/stevearc/conform.nvim/issues/92
		local function format_hunks()
			local ignore_filetypes = { "lua" }
			if vim.tbl_contains(ignore_filetypes, vim.bo.filetype) then
				vim.notify("range formatting for " .. vim.bo.filetype .. " not working properly.")
				return
			end

			local hunks = require("gitsigns").get_hunks()
			if hunks == nil then
				return
			end

			local format = require("conform").format

			local function format_range()
				if next(hunks) == nil then
					vim.notify("done formatting git hunks", "info", { title = "formatting" })
					return
				end
				local hunk = nil
				while next(hunks) ~= nil and (hunk == nil or hunk.type == "delete") do
					hunk = table.remove(hunks)
				end

				if hunk ~= nil and hunk.type ~= "delete" then
					local start = hunk.added.start
					local last = start + hunk.added.count
					-- nvim_buf_get_lines uses zero-based indexing -> subtract from last
					local last_hunk_line = vim.api.nvim_buf_get_lines(0, last - 2, last - 1, true)[1]
					local range = { start = { start, 0 }, ["end"] = { last - 1, last_hunk_line:len() } }
					format({ range = range, async = true, lsp_fallback = true }, function()
						vim.defer_fn(function()
							format_range()
						end, 1)
					end)
				end
			end

			format_range()
		end

		local conform = require("conform")
		conform.setup({
			formatters_by_ft = {
				typescript = { "prettierd", "prettier", stop_after_first = true },
				javascript = { "prettierd", "prettier", stop_after_first = true },
				lua = { "stylua" },
				go = { "gofmt", "goimports " },
				rust = { "rustfmt" },
				json = { "prettierd", "prettier", stop_after_first = true },
				html = { "prettierd", "prettier", stop_after_first = true },
			},

			format_on_save = function(bufnr)
				if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
					return
				end
				local disable_filetypes = { js = false }
				return {
					timeout_ms = 500,
					lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype],
				}
			end,
			-- format_on_save = function()
			-- 	-- Prefer to format git hunks instead of the entire file
			-- 	format_hunks()
			-- end,
			--
			formatters = {
				prettier = {
					require_cwd = true,
					prepend_args = { "--prose-wrap", "always" },
				},
			},
		})

		-- when project does not have prettier config run this
		vim.api.nvim_create_user_command("FormatDisable", function(args)
			if args.bang then
				-- FormatDisable! will disable formatting just for this buffer
				vim.b.disable_autoformat = true
			else
				vim.g.disable_autoformat = true
			end
		end, {
			desc = "Disable autoformat-on-save",
			bang = true,
		})
		vim.api.nvim_create_user_command("FormatEnable", function()
			vim.b.disable_autoformat = false
			vim.g.disable_autoformat = false
		end, {
			desc = "Re-enable autoformat-on-save",
		})

		vim.keymap.set({ "n", "v" }, "<leader>mp", function()
			conform.format({
				lsp_fallback = true,
				async = false,
				timeout_ms = 500,
			})
		end, { desc = "Format file or range (in visual mode)" })

		vim.keymap.set("n", "<leader>df", "<cmd> :FormatDisable<CR>")
	end,
}
