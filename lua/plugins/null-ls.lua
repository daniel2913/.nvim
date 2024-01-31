
local null_ls = require('null-ls')
null_ls.setup({
	sources = {
		null_ls.builtins.formatting.prettierd.with({
			env = {
				PRETTIERD_DEFAULT_CONFIG = "C:/Users/user/Desktop/next-shop/.prettierrc.json"
			}

		})
	},
	defaults = {
		border = nil,
		cmd = { "nvim" },
		debounce = 10000,
		debug = false,
		default_timeout = 2000,
		diagnostic_config = {},
		diagnostics_format = "#{m}",
		fallback_severity = vim.diagnostic.severity.ERROR,
		log_level = "warn",
		notify_format = "[null-ls] %s",
		on_attach = nil,
		on_init = nil,
		on_exit = nil,
		root_dir = require("null-ls.utils").root_pattern(".null-ls-root", "Makefile", ".git"),
		should_attach = nil,
		sources = nil,
		temp_dir = nil,
		update_in_insert = false,
	},
})
vim.keymap.set('n', '<leader>f', vim.lsp.buf.format)

