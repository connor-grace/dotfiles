return {
  {
    'saghen/blink.cmp',
    version = '1.*',
    dependencies = {
      -- Use LuaSnip as the snippet engine
      { 'L3MON4D3/LuaSnip', version = 'v2.*' },
    },
    ---@type blink.cmp.Config
    opts = {
      -- Use LuaSnip for snippet expansion/navigation
      snippets = { preset = 'luasnip' },

      -- Keep keymaps close to previous behavior (C-y accept, C-Space open)
      keymap = { preset = 'default' },

      appearance = {
        nerd_font_variant = 'mono',
      },

      -- Show docs on demand to reduce noise
      completion = { documentation = { auto_show = false } },

      -- Core sources enabled by default
      sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer' },
      },
    },
    opts_extend = { 'sources.default' },
  },
}
