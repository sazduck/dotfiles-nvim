local function set(mode, l, r, opts)
  opts = opts or {}
  -- opts.buffer = bufnr
  vim.keymap.set(mode, l, r, opts)
end

if pcall(require, "telescope") then
  local builtin = require("telescope.builtin")
  set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
  set("n", "<leader>fg", builtin.live_grep,  { desc = "Telescope live grep" })
  set("n", "<leader>fb", builtin.buffers,    { desc = "Telescope buffers" })
  set("n", "<leader>fh", builtin.help_tags,  { desc = "Telescope help tags" })
end

if pcall(require, "neo-tree") then
  set("n", "<leader>e", ":Neotree filesystem reveal left<CR>", { silent = true, desc = "Open explorer"  })
end

if pcall(require, "lspconfig") then
  set("n", "gh", vim.lsp.buf.hover, { desc = 'Hover' })
  set("n", "gd", vim.lsp.buf.definition, { desc = 'Go to definition' })
  set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = 'Code actions' })
  set("n", "<leader>r", vim.lsp.buf.rename, { desc = 'Rename variable' })
end

if pcall(require, "null-ls") then
  set({"n", "v"}, "<leader>cf", vim.lsp.buf.format, { desc = 'Code fromat' })
end

if pcall(require, "gitsigns") then
  local gs = require('gitsigns')

  set("n", "]c", function ()
    if vim.wo.diff then return "]c" end

    vim.schedule(function ()
      gs.next_hunk()
    end)

    return "<Ignore>"
  end, { expr=true, desc = 'next hunk' })

  set("n", "[c", function ()
    if vim.wo.diff then return "[c" end

    vim.schedule(function ()
      gs.prev_hunk()
    end)

    return "<Ignore>"
  end, { expr=true, desc = 'prev hunk' })

  set('n', '<leader>hs', gs.stage_hunk, { desc = 'stage hunk' })
  set('n', '<leader>hr', gs.reset_hunk, { desc = 'reset hunk' })
  set("v", "<leader>hs", function()
    gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
  end, { desc = 'stage hunk' })
	set("v", "<leader>hr", function()
		gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
	end, { desc = 'reset hunk' })

  set("n", "<leader>ha", gs.stage_hunk, { desc = 'stage hunk' })
  set("n", "<leader>hu", gs.undo_stage_hunk, { desc = 'undo stage hunk' })

  set("n", "<leader>hS", gs.stage_buffer, { desc = 'stage buffer' })
  set("n", "<leader>hr", gs.reset_buffer, { desc = 'reset buffer' })

  set("n", "<leader>hp", gs.preview_hunk, { desc = 'preview hunk' })

  set('n', '<leader>hb', function() gs.blame_line{full=true} end, { desc = 'Git blame line' })
  set('n', '<leader>hd', gs.diffthis, { desc = 'diff this' })

  set({'o', 'x'}, 'ih', ':<C-U>Gitsigns select_hunk<CR>', { desc = 'selet hunk'})
end
