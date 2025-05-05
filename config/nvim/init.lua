require 'josean.core.options'
require 'josean.core.keymaps'
require 'josean.utils.path'
require 'josean.utils.tabline'

require 'josean.lazy'
require('lazy').setup {
  { import = 'josean.plugins' },
  { import = 'josean.plugins.lsp' },
}
