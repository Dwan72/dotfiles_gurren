return {
  'nvim-treesitter/nvim-treesitter',
  event = { 'BufReadPre', 'BufNewFile' },
  build = ':TSUpdate',
  dependencies = {
    'windwp/nvim-ts-autotag',
    'nvim-treesitter/nvim-treesitter-textobjects', -- Required for textobjects
  },
  config = function()
    -- import nvim-treesitter plugin
    local treesitter = require 'nvim-treesitter.configs'

    -- configure treesitter
    treesitter.setup {
      -- enable syntax highlighting
      highlight = {
        enable = true,
      },
      -- enable indentation
      indent = { enable = true },
      -- enable autotagging (w/ nvim-ts-autotag plugin)
      autotag = {
        enable = true,
      },
      -- ensure these language parsers are installed
      ensure_installed = {
        'python',
        'go',
        'json',
        'javascript',
        'typescript',
        'tsx',
        'yaml',
        'html',
        'css',
        'prisma',
        'markdown',
        'markdown_inline',
        'graphql',
        'bash',
        'lua',
        'vim',
        'dockerfile',
        'gitignore',
        'query',
        'vimdoc',
        'c',
      },
      textobjects = {
        select = {
          enable = true,
          lookahead = true,
          keymaps = {
            ['af'] = '@function.outer',
            ['if'] = '@function.inner',
            ['ac'] = '@class.outer',
            ['ic'] = '@class.inner',
          },
        },
        move = {
          enable = true,
          set_jumps = true,
          goto_next_start = {
            [']f'] = { query = '@function.outer', desc = 'Next function start' },
            [']]'] = { query = '@class.outer', desc = 'Next class start' },
          },
          goto_next_end = {
            [']F'] = { query = '@function.outer', desc = 'Next function end' },
            [']['] = { query = '@class.outer', desc = 'Next class end' },
          },
          goto_previous_start = {
            ['[f'] = { query = '@function.outer', desc = 'Previous function start' },
            ['[['] = { query = '@class.outer', desc = 'Previous class start' },
          },
          goto_previous_end = {
            ['[F'] = { query = '@function.outer', desc = 'Previous function end' },
            ['[]'] = { query = '@class.outer', desc = 'Previous class end' },
          },
        },
      },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = '<C-space>',
          node_incremental = '<C-space>',
          scope_incremental = false,
          node_decremental = '<bs>',
        },
      },
    }
  end,
}
