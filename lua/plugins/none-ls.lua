return {
  {
    "jay-babu/mason-null-ls.nvim",
    config = function()
      require ('mason-null-ls').setup({
        ensure_installed = {
          'stylua',
          'prettier',
        }
      })
    end
  },
  {
    "nvimtools/none-ls.nvim",
    -- dependencies = {
    --   "nvimtools/none-ls-extras.nvim",
    -- },
    config = function()
      local null_ls = require("null-ls")
      null_ls.setup({
        sources = {
          null_ls.builtins.formatting.prettier,
          null_ls.builtins.formatting.stylua,
          null_ls.builtins.completion.spell,
          -- require("none-ls.diagnostics.eslint"), -- requires none-ls-extras.nvim
        }
      })
    end
  }}
