return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      require("catppuccin").setup({
        custom_highlights = function(colors)
          return {
            CursorLineNr = { fg = colors.mauve },
            LineNr =       { fg = colors.overlay0 },
            TabLineSel =   { bg = colors.pink },
          }
        end,
        transparent_background = true,
      })

      vim.cmd.colorscheme("catppuccin-mocha")
    end,
  },
  {
    "rose-pine/neovim",
    name = "rose-pine",
  },
}
