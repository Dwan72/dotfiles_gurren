return {
  'rmagatti/auto-session',
  config = function()
    require('auto-session').setup {
      auto_restore = true,
      auto_restore_last_session = false,
      auto_save = true,
      enabled = true,
      git_use_branch_name = true,
      log_level = 'error',
      pre_save_cmds = { 'silent! wa' },
      root_dir = '$HOME/.local/share/nvim/sessions/',
      save_buffers_with_tabs = true,
      saveopt = {
        sessionoptions = 'blank,buffers,curdir,folds,globals,help,tabpages,terminal,winsize',
      },
      session_globals = {
        buffers = { '[]' },
        file_types = { '[]' },
        vars = { '[]' },
      },
      session_lens = {
        buftypes_to_ignore = {},
        load_on_setup = true,
        previewer = false,
        theme_conf = {
          border = true,
        },
      },
    }

    vim.o.sessionoptions = 'blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions'
    -- Optional key mappings for session management
    vim.keymap.set('n', '<leader>ws', '<cmd>SessionSave<CR>', { desc = 'Save session' })
    vim.keymap.set('n', '<leader>wr', '<cmd>SessionRestore<CR>', { desc = 'Load session' })
    vim.keymap.set('n', '<leader>wd', '<cmd>SessionDelete<CR>', { desc = 'Delete session' })
  end,
  dependencies = {
    { 'nvim-telescope/telescope.nvim' }, -- Only if you want session selection with telescope
  },
}
