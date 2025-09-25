return {
  "HiPhish/rainbow-delimiters.nvim",
  event = "VeryLazy",
  config = function ()
    require('rainbow-delimiters.setup').setup {
      highlight = {
        'RainbowDelimiterRed',
        'RainbowDelimiterOrange',
        'RainbowDelimiterYellow',
        'RainbowDelimiterBlue',
        'RainbowDelimiterGreen',
        'RainbowDelimiterViolet',
      },
    }
  end,
}
