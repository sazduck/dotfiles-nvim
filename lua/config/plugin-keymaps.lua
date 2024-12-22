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
  set("n", "<leader>e", ":Neotree filesystem reveal left<CR>", { silent = true })
end

if pcall(require, "lspconfig") then
  set("n", "gh", vim.lsp.buf.hover, {})
  set("n", "gd", vim.lsp.buf.definition, {})
  set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
end

if pcall(require, "null-ls") then
  set({"n", "v"}, "<leader>cf", vim.lsp.buf.format, {})
end

if pcall(require, "gitsigns") then
  local gs = require('gitsigns')

  set("n", "]c", function ()
    if vim.wo.diff then return "]c" end

    vim.schedule(function ()
      gs.next_hunk()
    end)

    return "<Ignore>"
  end, {expr=true})

  set("n", "[c", function ()
    if vim.wo.diff then return "[c" end

    vim.schedule(function ()
      gs.prev_hunk()
    end)

    return "<Ignore>"
  end, {expr=true})

  set('n', '<leader>hs', gs.stage_hunk)
  set('n', '<leader>hr', gs.reset_hunk)
  set('v', '<leader>hs', function() gs.stage_hunk {vim.fn.line('.'), vim.fn.line('v')} end)
  set('v', '<leader>hr', function() gs.reset_hunk {vim.fn.line('.'), vim.fn.line('v')} end)

  set("n", "<leader>ha", gs.stage_hunk)
  set("n", "<leader>hu", gs.undo_stage_hunk)

  set("n", "<leader>hS", gs.stage_buffer)
  set("n", "<leader>hr", gs.reset_buffer)

  set("n", "<leader>hp", gs.preview_hunk)

  set('n', '<leader>hb', function() gs.blame_line{full=true} end)
  set('n', '<leader>hd', gs.diffthis)

  set({'o', 'x'}, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
end
