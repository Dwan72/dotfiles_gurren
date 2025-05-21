return {
  'radyz/telescope-gitsigns',
  dependencies = {
    'lewis6991/gitsigns.nvim',
    'nvim-telescope/telescope.nvim',
  },

  vim.keymap.set('n', '<leader>gt', function()
    vim.cmd 'Telescope git_signs'
  end, { desc = 'Telescope Hunks' }),
}
