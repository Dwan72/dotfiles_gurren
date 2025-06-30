return {
  'matthiasweiss/angular-quickswitch.nvim',
  opts = {}, -- default options, or configure if needed
  keys = {
    { '<leader>u', '<cmd>NgQuickSwitchComponent<cr>', desc = 'Switch to Component Class' },
    { '<leader>i', '<cmd>NgQuickSwitchTemplate<cr>', desc = 'Switch to Component Template' },
    { '<leader>o', '<cmd>NgQuickSwitchTest<cr>', desc = 'Switch to Component Test' },
  },
}
