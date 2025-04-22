local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable',
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)
require 'josean.core'
require 'josean.lazy'

--require 'j.mappings'
--require 'j.autocmds'
--require 'j.commands'
--require 'j.settings'
--require 'j.alternatives'
--require 'j.statusline'
--require 'j.tabline'
--require 'j.disable_lint_rule'

-- require('lazy').setup('j.plugins', {
--   install = {
--     colorscheme = { 'kanagawa' },
--   },
--   dev = {
--     path = '~/Code/Projects',
--   },
--   change_detection = {
--     notify = false,
--   },
-- })
