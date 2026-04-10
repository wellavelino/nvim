local M = {}

-- Custom handler that filters out stale inlay hints with out-of-range positions.
-- Workaround for Neovim 0.11.x bug where nvim_buf_set_extmark fails because
-- the LSP server returns hint positions that exceed the current line length.
local default_inlay_hint_handler = vim.lsp.handlers["textDocument/inlayHint"]

if default_inlay_hint_handler then
	vim.lsp.handlers["textDocument/inlayHint"] = function(err, result, ctx, config)
		if err or not result then
			return default_inlay_hint_handler(err, result, ctx, config)
		end

		local bufnr = ctx.bufnr
		if not bufnr or not vim.api.nvim_buf_is_valid(bufnr) then
			return
		end

		local filtered = {}
		for _, hint in ipairs(result) do
			local line = hint.position and hint.position.line
			local col = hint.position and hint.position.character
			if line and col then
				local line_count = vim.api.nvim_buf_line_count(bufnr)
				if line < line_count then
					local line_text = vim.api.nvim_buf_get_lines(bufnr, line, line + 1, false)[1]
					if line_text and col <= #line_text then
						table.insert(filtered, hint)
					end
				end
			end
		end

		return default_inlay_hint_handler(err, filtered, ctx, config)
	end
end

-- Shared on_attach for all LSP clients.
function M.on_attach(client, bufnr)
	if client.server_capabilities.inlayHintProvider then
		vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
	end
end

-- Global diagnostic configuration.
vim.diagnostic.config({
	virtual_text = {
		prefix = "●",
		source = "if_many",
	},
	float = {
		source = true,
		border = "rounded",
	},
	signs = true,
	underline = true,
	update_in_insert = false,
	severity_sort = true,
})

-- Diagnostic signs.
vim.fn.sign_define("DiagnosticSignError", { text = "✗", texthl = "DiagnosticSignError" })
vim.fn.sign_define("DiagnosticSignWarn", { text = "⚠", texthl = "DiagnosticSignWarn" })
vim.fn.sign_define("DiagnosticSignInfo", { text = "ℹ", texthl = "DiagnosticSignInfo" })
vim.fn.sign_define("DiagnosticSignHint", { text = "➤", texthl = "DiagnosticSignHint" })

return M
