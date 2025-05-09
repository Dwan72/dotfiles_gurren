return {
  'saghen/blink.cmp',
  dependencies = {
    { 'xzbdmw/colorful-menu.nvim', opts = {} },
  },
  enabled = true,
  version = '1.*',
  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    keymap = { preset = 'default' },

    appearance = {
      nerd_font_variant = 'mono',
      kind_icons = {
        Constant = '',
        Field = '',
        Property = '',
        Interface = '',
        Keyword = '',
        Type = '',
        TypeParameter = '',
        Variable = '',
        Class = '',
        Function = '',
        Method = '',
      },
    },

    completion = {
      documentation = {
        auto_show = true,
        window = {
          border = 'rounded',
        },
      },
      menu = {
        border = 'none',
        draw = {
          columns = {
            { 'kind_icon' },
            { 'label', gap = 1 },
            { 'kind' },
          },
          components = {
            label = {
              text = function(ctx)
                return require('colorful-menu').blink_components_text(ctx)
              end,
              highlight = function(ctx)
                return require('colorful-menu').blink_components_highlight(ctx)
              end,
            },
          },
        },
      },
    },

    sources = {
      default = { 'lsp', 'path', 'snippets', 'buffer' },
    },

    snippets = { preset = 'luasnip' },

    fuzzy = { implementation = 'prefer_rust_with_warning' },
  },
  opts_extend = { 'sources.default' },
}
