return {
  {
    "williamboman/mason.nvim",
    opts = {},
  },
	{
		"williamboman/mason-lspconfig.nvim",
		opts = {
      ensure_installed = {
        "lua_ls",
        "eslint",
        "ts_ls",
        "gopls",
      },
    }
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local lspconfig = require("lspconfig")
			lspconfig.lua_ls.setup({})
			lspconfig.eslint.setup({})
			lspconfig.ts_ls.setup({})
			lspconfig.gopls.setup({})
		end,
	},
}
