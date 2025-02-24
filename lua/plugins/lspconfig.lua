return {
	{
		"neovim/nvim-lspconfig",
		---@class PluginLspOpts
		opts = {
			---@type lspconfig.options
			servers = {
				-- pyright will be automatically installed with mason and loaded with lspconfig
				pyright = {},
				fortls = {
					root_dir = require("lspconfig").util.root_pattern(".fortls"),
				},
			},
		},
	},
}
