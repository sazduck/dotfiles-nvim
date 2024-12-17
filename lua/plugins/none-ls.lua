local src = {
  formatting = {
    "stylua",
    "prettier",
  },
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
      ensure_installed = src.formatting,
    },
  },
  {
    "nvimtools/none-ls.nvim",
    config = function()
      local null_ls = require("null-ls")

      local source = {}

      for buitlin, plugins in pairs(src) do
        for _, plugin in ipairs(plugins) do
          table.insert(source, null_ls.builtins[buitlin][plugin])
        end
      end

      null_ls.setup({
        sources = source,
      })
    end,
  },
}
