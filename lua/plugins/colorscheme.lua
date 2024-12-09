return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  config = function()

    require("catppuccin").setup({

      -- transparent_background = true,

      custom_highlights = function(colors)
        return {
          CursorLineNr = { fg = colors.mauve },
          LineNr = { fg = colors.overlay0 },
          TabLineSel = { bg = colors.pink },
        }
      end,

    })

    vim.cmd.colorscheme "catppuccin-mocha"

  end
}
































