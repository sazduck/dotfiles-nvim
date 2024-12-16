local set = vim.keymap.set
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
