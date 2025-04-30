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
      vim.api.nvim_set_hl(0, 'someRed', { fg = '#252530' })
    end)

    local ibl = require('ibl').setup {
      indent = {
        char = '▏',
        highlight = highlight,
      },
    }
  end,
}
