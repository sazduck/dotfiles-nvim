local src = {
  formatting = {
    "stylua",
    "prettier",
  },
  diagnostics = {},
}

return {
  {
    "jay-babu/mason-null-ls.nvim",
    opts = {
      ensure_installed = vim.tbl_flatten({ src.formatting, src.diagnostics }),
    },
  },
  {
    "nvimtools/none-ls.nvim",
    lazy = false,
    config = function()
      local null_ls = require("null-ls")

      null_ls.setup({
        sources = {
          null_ls.builtins.formatting.stylua,
          null_ls.builtins.formatting.prettier.with({
            env = {
              PRETTIER_DEFAULT_CONFIG = vim.fn.expand("~/.config/nvim/utils/linter-config/.prettierrc.json"),
            },
          }),
        },
      })
    end,
    keys = {
      { "<leader>cf", vim.lsp.buf.format, desc = "Code fromat", mode = { "n", "v" } },
    },
  },
}
