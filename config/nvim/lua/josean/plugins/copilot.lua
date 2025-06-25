return {
  'github/copilot.vim',
  event = 'InsertEnter',
  config = function()
    -- disable the default <Tab> mapping
    vim.g.copilot_no_tab_map = true
    -- Accept suggestion with <C-J> in insert mode
    vim.api.nvim_set_keymap('i', '<C-J>', 'copilot#Accept("<CR>")', { silent = true, expr = true })

    -- (optional) you can toggle Copilot panel with:
    vim.api.nvim_set_keymap('n', '<leader>co', ':Copilot panel<CR>', { silent = true })
  end,
}
