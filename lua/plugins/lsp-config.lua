return {
  {
    "williamboman/mason.nvim",
    opts = {
      -- ui = {
      --   border = "rounded",
      -- },
    },
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls", "ts_ls" }
      })
    end
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")
      lspconfig.ts_ls.setup({})
      lspconfig.lua_ls.setup({})
    end
  }

}
