return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    opts = {
      custom_highlights = function(colors)
        return {
          CursorLineNr = { fg = colors.mauve },
          LineNr = { fg = colors.overlay0 },
          TabLineSel = { bg = colors.pink },
          MsgSeparator = { bg = colors.mantle },
        }
      end,
      -- transparent_background = true,
      init = function()
        vim.cmd.colorscheme("catppuccin-mocha")
      end,
    },
  },
  -- {
  --   "rose-pine/neovim",
  --   priority = 1000,
  --   name = "rose-pine",
  -- },
  -- {
  --   "folke/tokyonight.nvim",
  --   lazy = false,
  --   name = "tokyonight",
  --   priority = 1000,
  -- }
}
