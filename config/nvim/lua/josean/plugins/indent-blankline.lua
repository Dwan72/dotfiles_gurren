return {
  'lukas-reineke/indent-blankline.nvim',
  main = 'ibl',
  ---@module "ibl"
  ---@type ibl.config
  opts = {},
  dependencies = {
    'nvim-treesitter/nvim-treesitter',
  },
  config = function()
    local highlight = {
      'someRed',
    }
    local hooks = require 'ibl.hooks'
    hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
      vim.api.nvim_set_hl(0, 'someRed', { fg = '#323242' })
      vim.api.nvim_set_hl(0, 'IblScope', { fg = '#484857' })
    end)

    local ibl = require('ibl').setup {
      indent = {
        char = '▏',
        highlight = highlight,
      },
      scope = {
        enabled = true,
        show_start = false,
        show_end = false,
        include = {
          node_type = {
            typescript = {
              'object_type',
              'class_body',
              'interface_body',
            },
            ['*'] = { '*' }, -- catch-all fallback for all nodes and languages
          },
        },
      },
    }
  end,
}
