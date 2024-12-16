
return {
  {
    "williamboman/mason.nvim",
    opts = {
      ui = {
        border = "rounded",
        title = "Mason"
      },
      PATH = "prepend",
    }
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

      local border = "rounded"

      vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
        border = border,
      })

      vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
        border = border,
      })

      vim.diagnostic.config({
        float = { border = border },
      })

      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      lspconfig.lua_ls.setup({ capabilities = capabilities })
      lspconfig.eslint.setup({ capabilities = capabilities })
      lspconfig.ts_ls.setup({ capabilities = capabilities })
      lspconfig.gopls.setup({ capabilities = capabilities })
    end,
  },
}
