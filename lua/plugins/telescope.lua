return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-ui-select.nvim",
    },
    lazy = false,
    config = function ()
      local telescope = require("telescope")
      telescope.setup({
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown({})
          },
        },
      })
      require("telescope").load_extension("ui-select")
    end,
    keys = {
      { "<leader>ff", "<cmd>Telescope find_files<CR>", desc = "Telescope find files" },
      { "<leader>fg", "<cmd>Telescope live_grep<CR>",  desc = "Telescope live grep" },
      { "<leader>fb", "<cmd>Telescope buffers<CR>",    desc = "Telescope buffers" },
      { "<leader>fh", "<cmd>Telescope help_tags<CR>",  desc = "Telescope help tags" },
    },
  },
}
