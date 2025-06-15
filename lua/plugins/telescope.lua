return {
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
      { "<leader>ff", require("telescope.builtin").find_files, desc = "Telescope find files" },
      { "<leader>fg", require("telescope.builtin").live_grep,  desc = "Telescope live grep" },
      { "<leader>fb", require("telescope.builtin").buffers,    desc = "Telescope buffers" },
      { "<leader>fh", require("telescope.builtin").help_tags,  desc = "Telescope help tags" },
    },
  },
  {
    "nvim-telescope/telescope-ui-select.nvim",
    config = function()
      require("telescope").setup({
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown({})
          },
        },
      })
      require("telescope").load_extension("ui-select")
    end,
  },
}
