return {
  {
    "williamboman/mason.nvim",
    opts = {
      ui = {
        border = "rounded",
      },
    },
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
    },
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")

      local _border = "rounded"

      vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
        border = _border,
      })

      vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
        border = _border,
      })

      vim.diagnostic.config({
        float = { border = _border },
      })
      lspconfig.lua_ls.setup({})
      lspconfig.eslint.setup({})
      lspconfig.ts_ls.setup({})
      lspconfig.gopls.setup({})
    end,
  },
}
