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

      for _, lsp in ipairs(lsps) do
        lspconfig[lsp].setup({ capabilities = capabilities })
      end

      vim.filetype.add({
        pattern = {
          [".*/hypr/.*%.conf"] = "hyprlang",
          [".*/bash/.*"] = "bash",
        },
      })

      vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
        pattern = {
          ".*/hypr/.*%.conf",
          "hypr*.conf",
          ".*/bash/.*",
        },
        callback = function()
          if vim.bo.filetype == "hyprlang" then
            vim.lsp.start({
              name = "hyprlang",
              cmd = { "hyprls" },
              root_dir = vim.fn.getcwd(),
            })
          elseif vim.bo.filetype == "bash" then
            vim.lsp.start({
              name = "bash",
              cmd = { "bashls" },
              root_dir = vim.fn.getcwd(),
            })
          end
        end,
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
