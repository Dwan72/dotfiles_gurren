return {
  {
    'lewis6991/gitsigns.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    opts = {
      signs = {
        add = { text = '▕' },
        change = { text = '▕' },
        delete = { text = '▕' },
        topdelete = { text = '‾' },
        changedelete = { text = '▕' },
        untracked = { text = '▕' },
      },
      on_attach = function(bufnr)
        local gs = package.loaded.gitsigns
        local function map(mode, l, r, opts)
          opts = opts or {}
          opts.buffer = bufnr
          vim.keymap.set(mode, l, r, opts)
        end

        -- Navigation
        map('n', ']c', function()
          if vim.wo.diff then
            return ']c'
          end
          vim.schedule(function()
            gs.next_hunk()
          end)
          return '<Ignore>'
        end, { expr = true })
        map('n', '[c', function()
          if vim.wo.diff then
            return '[c'
          end
          vim.schedule(function()
            gs.prev_hunk()
          end)
          return '<Ignore>'
        end, { expr = true })

        -- Actions
        map('n', '<leader>Gs', gs.stage_hunk)
        map('n', '<leader>Gr', gs.reset_hunk)
        map('v', '<leader>Gs', function()
          gs.stage_hunk { vim.fn.line '.', vim.fn.line 'v' }
        end)
        map('v', '<leader>hr', function()
          gs.stage_hunk { vim.fn.line '.', vim.fn.line 'v' }
        end)
        map('n', '<leader>GS', gs.stage_buffer)
        map('n', '<leader>Gu', gs.undo_stage_hunk)
        map('n', '<leader>GR', gs.reset_buffer)
        map('n', '<leader>Gp', gs.preview_hunk)
        map('n', '<leader>Gb', function()
          gs.blame_line { full = true }
        end)
        map('n', '<leader>Gd', gs.diffthis)
        map('n', '<leader>GD', function()
          gs.diffthis '~'
        end)

        -- Text object
        map({ 'o', 'x' }, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
      end,
    },
  },
  { 'FabijanZulj/blame.nvim', opts = {} },
}
