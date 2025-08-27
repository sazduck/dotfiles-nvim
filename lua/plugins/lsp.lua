local lsps = {
  "lua_ls",
  "ts_ls",
  "eslint",
  "gopls",
  "hyprls",
  "emmet_language_server",
  "clangd",
  "phpactor",
  "bashls",
  "astro",
  "cssls",
  "vuels",
  "tailwindcss",
  "pyright",
  "rust_analyzer",
}

return {
  {
    "mason-org/mason.nvim",
    opts = {
      PATH = "prepend",
      ui = {
        border = "rounded",
        title = " Mason ",
      },
    },
  },
  {
    "mason-org/mason-lspconfig.nvim",
    opts = {
      ensure_installed = lsps,
    },
  },

  {
    "neovim/nvim-lspconfig",
    lazy = false,
    config = function()
      local lspconfig = require("lspconfig")
      local borderStyle = "rounded"
      vim.diagnostic.config({
        virtual_text = true,
        signs = true,
        underline = true,
        update_in_insert = false,
      })
      local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
      ---@diagnostic disable-next-line: duplicate-set-field
      function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
        opts = opts or {}
        opts.border = borderStyle
        return orig_util_open_floating_preview(contents, syntax, opts, ...)
      end

      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      require("mason-lspconfig").setup_handlers({
        function(server_name) -- Обработчик по умолчанию
          lspconfig[server_name].setup({
            capabilities = capabilities,
          })
        end,
        ["hyprls"] = function()
          lspconfig["hyprls"].setup({
            capabilities = capabilities,
            on_attach = function(_, bufnr)
              vim.api.nvim_buf_set_option(bufnr, "filetype", "hyprlang")
            end,
          })
        end,
        ["bashls"] = function()
          lspconfig["bashls"].setup({
            capabilities = capabilities,
            on_attach = function(_, bufnr)
              vim.api.nvim_buf_set_option(bufnr, "filetype", "bash")
            end,
          })
        end,
      })

      vim.filetype.add({
        pattern = {
          [".*/hypr/.*%.conf"] = "hyprlang",
          [".*/bash/.*"] = "bash",
        },
      })
    end,
    keys = {
      { "gh",         vim.lsp.buf.hover,       desc = "Hover" },
      { "gd",         vim.lsp.buf.definition,  desc = "Go to definition" },
      { "<leader>ca", vim.lsp.buf.code_action, desc = "Code actions",    mode = { "n", "v" } },
      { "<leader>r",  vim.lsp.buf.rename,      desc = "Rename variable" },
    },
  },
}
