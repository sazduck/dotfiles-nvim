return {
  "nvim-lualine/lualine.nvim",
  opts = {
    options = {
      theme = "catppuccin",
    },
    sections = {
      lualine_c = {
        {
          "filename",
          path = 4,
        },
      },
    },
  },
}
