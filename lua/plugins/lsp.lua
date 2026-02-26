local lsps = {
  "clangd", "gopls", "templ", "rust_analyzer", "pyright", "lua_ls", "hyprls", "phpactor", "bashls",

  "ts_ls", "eslint", "emmet_language_server",
  "svelte", "vue_ls", "astro",
  "cssls", "tailwindcss",
}

return {
  {
    "mason-org/mason.nvim",
    opts = {
      PATH = "prepend",
      ui = {
        -- border = "rounded",
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


      vim.diagnostic.config({
        virtual_text = true,
        signs = true,
        underline = true,
        update_in_insert = false,
      })

      vim.filetype.add({
        pattern = {
          [".*/hypr/.*%.conf"] = "hyprlang",
          [".*/bash/.*"] = "bash",
        },
      })

      vim.lsp.enable(lsps)
      vim.lsp.completion.enable = true

    end,
    keys = {
      { "gh",         vim.lsp.buf.hover,       desc = "Hover" },
      { 'K',          vim.lsp.buf.hover,       desc = "Hover" },
      { "gd",         vim.lsp.buf.definition,  desc = "Go to definition" },
      { "<leader>ca", vim.lsp.buf.code_action, desc = "Code actions",    mode = { "n", "v" } },
      { "<leader>r",  vim.lsp.buf.rename,      desc = "Rename variable" },
    },
  },
}
