return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  opts = {
    auto_install = true,
    sync_install = false,
    highlight = { enable = true },
    indent = { enable = true },
  },
}

