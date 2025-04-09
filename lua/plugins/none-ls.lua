local src = {
  formatting = {
    "stylua",
    "prettier",
  },
  diagnostics = {}
}

local function merge_arrays(...)
  local merged = {}
  local seen = {}

  for _, array in ipairs({ ... }) do
    for _, value in ipairs(array) do
      if not seen[value] then
        seen[value] = true
        table.insert(merged, value) -- Добавляем элемент
      end
    end
  end

  return merged
end

return {
  {
    "jay-babu/mason-null-ls.nvim",
    opts = {
      ensure_installed = merge_arrays(src.formatting, src.diagnostics),
    },
  },
  {
    "nvimtools/none-ls.nvim",
    config = function()
      local null_ls = require("null-ls")

      local sources = {}

      for builtin, plugins in pairs(src) do -- Исправлено: builtin вместо buitlin
        for _, plugin in ipairs(plugins) do
          if null_ls.builtins[builtin][plugin] then
            table.insert(sources, null_ls.builtins[builtin][plugin])
          else
            vim.notify("Plugin not found in null-ls.builtins: " .. plugin, vim.log.levels.WARN)
          end
        end
      end

      null_ls.setup({
        sources = sources,
      })
    end,
  },
}
