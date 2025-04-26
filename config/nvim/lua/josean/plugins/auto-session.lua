return {
  'rmagatti/auto-session',
  config = function()
    local auto_session = require 'auto-session'
    local uv = vim.loop
    local timer = uv.new_timer()
    timer:start(
      0,
      5 * 60 * 1000,
      vim.schedule_wrap(function()
        vim.cmd 'silent! SessionSave'
      end)
    )
    vim.opt.sessionoptions = { 'buffers', 'curdir', 'tabpages', 'winsize' }
    auto_session.setup {
      auto_restore_enabled = true,
      auto_session_suppress_dirs = { '~/', '~/Dev/', '~/Downloads', '~/Documents', '~/Desktop/' },
      auto_session_enabled = true, -- Enable auto-session
      auto_save_enabled = true, -- Enable auto-save
      auto_session_enable_last_session = false, -- Don't auto-load last session
    }

    local keymap = vim.keymap

    keymap.set('n', '<leader>wr', '<cmd>SessionRestore<CR>', { desc = 'Restore session for cwd' }) -- restore last workspace session for current directory
    keymap.set('n', '<leader>ws', '<cmd>SessionSave<CR>', { desc = 'Save session for auto session root dir' }) -- save workspace session for current working directory
  end,
}
