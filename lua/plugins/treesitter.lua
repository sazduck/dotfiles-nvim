return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  opts = {
    ensure_installed = {
        "javascript",
        "json",
        "jsonc",
        "lua",
        "markdown",
        "tsx",
        "typescript",
        "vim",
        "vimdoc",
    },
    auto_install = true,
    sync_install = false,
    highlight = { enable = true },
    indent = { enable = true },
  },
}
