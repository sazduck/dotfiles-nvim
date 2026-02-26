return {
  'saghen/blink.cmp',
  dependencies = { 'rafamadriz/friendly-snippets' },
  version = '1.*',
  opts = {
    completion = { documentation = { auto_show = true } },
    keymap = { preset = 'enter' },
    fuzzy = { implementation = "prefer_rust_with_warning" },
    sources = {
      default = { 'lsp', 'path', 'snippets', 'buffer' },
    },
  },
  opts_extend = { "sources.default" }

}
