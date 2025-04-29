return {
  'lewis6991/gitsigns.nvim',
  config = function()
    require('gitsigns').setup {
      on_attach = function(bufnr)
        local gitsigns = require 'gitsigns'
        local function map(mode, l, r, opts)
          opts = opts or {}
          opts.buffer = bufnr
          vim.keymap.set(mode, l, r, opts)
        end
        map('n', ']c', function()
          if vim.wo.diff then
            vim.cmd.normal { ']c', bang = true }
          else
            gitsigns.nav_hunk 'next'
          end
        end)

        map('n', '[c', function()
          if vim.wo.diff then
            vim.cmd.normal { '[c', bang = true }
          else
            gitsigns.nav_hunk 'prev'
          end
        end)
        map('n', '<leader>gp', gitsigns.preview_hunk, { desc = 'preview hunk' })
        map('n', '<leader>gi', gitsigns.preview_hunk_inline, { desc = 'preview hunk inline ' })
        map('n', '<leader>gb', function()
          gitsigns.blame_line { full = true }
        end, { desc = 'blame line' })
        map('n', '<leader>gr', gitsigns.reset_hunk, { desc = 'reset hunk' })
      end,
    }
  end,
}
