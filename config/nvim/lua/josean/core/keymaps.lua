vim.g.mapleader = ' '

local keymap = vim.keymap -- for conciseness

keymap.set('i', 'jk', '<ESC>', { desc = 'Exit insert mode with jk' })

-- window management
keymap.set('n', '<leader>sv', '<C-w>v', { desc = 'Split window vertically' }) -- split window vertically
keymap.set('n', '<leader>sh', '<C-w>s', { desc = 'Split window horizontally' }) -- split window horizontally
keymap.set('n', '<leader>se', '<C-w>=', { desc = 'Make splits equal size' }) -- make split windows equal width & height
keymap.set('n', '<leader>sx', '<cmd>close<CR>', { desc = 'Close current split' }) -- close current split window

keymap.set('n', '<leader>ta', '<cmd>tabnew<CR>', { desc = 'Open new tab' }) -- open new tab
keymap.set('n', '<leader>tx', '<cmd>tabclose<CR>', { desc = 'Close current tab' }) -- close current tab
keymap.set('n', '<leader>tn', '<cmd>tabn<CR>', { desc = 'Go to next tab' }) --  go to next tab
keymap.set('n', '<leader>tp', '<cmd>tabp<CR>', { desc = 'Go to previous tab' }) --  go to previous tab
keymap.set('n', '<leader>tf', '<cmd>tabnew %<CR>', { desc = 'Open current buffer in new tab' }) --  move current buffer to new tab

local function opts(desc)
  local options = { noremap = true, silent = true }
  if desc then
    options.desc = desc
  end
  return options
end

keymap.set({ 'v', 'n' }, '<leader>h', '^', opts 'Move to beginning of line')
keymap.set({ 'v', 'n' }, '<leader>l', '$', opts 'Move to end of line')

keymap.set({ 'v', 'n' }, 'J', '5j', { noremap = true, silent = true })
keymap.set({ 'v', 'n' }, 'K', '5k', { nowait = true, noremap = true, silent = true })

-- shift enter to move to new line
keymap.set('i', '<S-CR>', 'o<ESC>', { noremap = true, silent = true })
keymap.set('n', '<S-CR>', 'o<ESC>', { noremap = true, silent = true })

-- yy to only take text
keymap.set('n', 'yy', '^vg_y', { desc = 'Yank line text without newline' })

-- navigation
keymap.set('n', '<C-d>', '<C-d>zz', opts())
keymap.set('n', '<C-u>', '<C-u>zz', opts())
keymap.set('n', '<C-f>', '<C-f>zz', opts())
keymap.set('n', '<C-b>', '<C-b>zz', opts())

keymap.set('n', 'U', 'mzJ`z', opts 'Join in place')

-- search with *
keymap.set('n', '*', 'yiw:let @/=@"<CR>:set hls<CR>zz', opts 'Smart search word under cursor')

-- get filepath
keymap.set('n', '<leader>cp', ':let @+ = expand("%:p")<CR>', opts 'Get full file path')
