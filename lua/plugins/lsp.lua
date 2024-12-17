local lsps = {
  "lua_ls",
  "ts_ls",
  "eslint",
  "gopls",
  "hyprls",
  "emmet_language_server",
}

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
      ensure_installed = lsps,
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

      for _, lsp in pairs(lsps) do
        lspconfig[lsp].setup({ capabilities = capabilities })
      end

      -- Hyprlang LSP
      vim.filetype.add({
        pattern = { [".*/hypr/.*%.conf"] = "hyprlang" },
      })

      vim.api.nvim_create_autocmd({'BufEnter', 'BufWinEnter'}, {
          pattern = {".*/hypr/.*%.conf", "hypr*.conf"},
          callback = function()
              vim.lsp.start {
                  name = "hyprlang",
                  cmd = {"hyprls"},
                  root_dir = vim.fn.getcwd(),
              }
          end
      })
    end,
  },
}
