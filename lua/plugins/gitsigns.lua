return {
  "lewis6991/gitsigns.nvim",
  opts = {},
  keys = function()
    local gs = require("gitsigns")
    return {
      {
        "]c",
        function()
          if vim.wo.diff then
            return "]c"
          end

          vim.schedule(function()
            gs.next_hunk()
          end)

          return "<Ignore>"
        end,
        expr = true,
        desc = "next hunk",
      },

      {
        "[c",
        function()
          if vim.wo.diff then
            return "[c"
          end

          vim.schedule(function()
            gs.prev_hunk()
          end)

          return "<Ignore>"
        end,
        expr = true,
        desc = "prev hunk",
      },

      { "<leader>hs", gs.stage_hunk, desc = "stage hunk" },
      { "<leader>hr", gs.reset_hunk, desc = "reset hunk" },
      {
        "<leader>hs",
        function()
          gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
        end,
        mode = "v",
        desc = "stage hunk",
      },
      {
        "<leader>hr",
        function()
          gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
        end,
        mode = "v",
        desc = "reset hunk",
      },

      { "<leader>ha", gs.stage_hunk,      desc = "stage hunk" },
      { "<leader>hu", gs.undo_stage_hunk, desc = "undo stage hunk" },

      { "<leader>hS", gs.stage_buffer,    desc = "stage buffer" },
      { "<leader>hR", gs.reset_buffer,    desc = "reset buffer" },

      { "<leader>hp", gs.preview_hunk,    desc = "preview hunk" },

      {
        "<leader>hb",
        function()
          gs.blame_line({ full = true })
        end,
        desc = "Git blame line",
      },
      { "<leader>hd", gs.diffthis, desc = "diff this" },
    }
  end,
}
