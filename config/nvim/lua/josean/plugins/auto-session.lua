return {
  'rmagatti/auto-session',
  config = function()
    require('auto-session').setup {
      log_level = 'error',
      auto_session_enable_last_session = false,
      auto_session_root_dir = vim.fn.stdpath 'data' .. '/sessions/',
      auto_session_enabled = true,
      auto_save_enabled = true,
      auto_restore_enabled = true,
      auto_session_suppress_dirs = nil,
      auto_session_use_git_branch = true,
      -- Save all open buffers
      save_buffers_with_tabs = true,
      -- These options ensure complete state saving
      session_lens = {
        buftypes_to_ignore = {},
        load_on_setup = true,
        theme_conf = { border = true },
        previewer = false,
      },
      pre_save_cmds = {
        -- Force save all buffers before saving session
        'silent! wa',
      },
      -- Save all of these session elements
      session_globals = {
        -- Save global variables that start with uppercase letters
        vars = { '[]' },
        -- Hook to custom file types you want to save
        file_types = { '[]' },
        -- Hooks for specific buffers
        buffers = { '[]' },
      },
      -- Custom options for complete window restoration
      saveopt = {
        sessionoptions = 'blank,buffers,curdir,folds,globals,help,tabpages,terminal,winsize',
      },
    }
    -- auto save sesion before quitting
    vim.api.nvim_create_autocmd('VimLeavePre', {
      callback = function()
        -- Save session before quitting
        vim.cmd 'SessionSave'
      end,
      group = vim.api.nvim_create_augroup('AutoSessionSaveOnQuit', { clear = true }),
    })

    -- Optional key mappings for session management
    vim.keymap.set('n', '<leader>ws', '<cmd>SessionSave<CR>', { desc = 'Save session' })
    vim.keymap.set('n', '<leader>wr', '<cmd>SessionRestore<CR>', { desc = 'Load session' })
    vim.keymap.set('n', '<leader>wd', '<cmd>SessionDelete<CR>', { desc = 'Delete session' })
  end,
  dependencies = {
    { 'nvim-telescope/telescope.nvim' }, -- Only if you want session selection with telescope
  },
}
