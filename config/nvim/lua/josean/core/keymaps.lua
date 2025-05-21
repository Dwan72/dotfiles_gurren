vim.g.mapleader = ' '

local keymap = vim.keymap -- for conciseness

keymap.set('i', 'jk', '<ESC>', { desc = 'Exit insert mode with jk' })

local function opts(desc)
  local options = { noremap = true, silent = true }
  if desc then
    options.desc = desc
  end
  return options
end

-- window management
keymap.set('n', '<leader>sv', '<C-w>v', opts 'Split window vertically') -- split window vertically
keymap.set('n', '<leader>sh', '<C-w>s', opts 'Split window horizontally') -- split window horizontally
keymap.set('n', '<leader>se', '<C-w>=', opts 'Make splits equal size') -- make split windows equal width & height
keymap.set('n', '<leader>sx', '<cmd>close<CR>', opts 'Close current split') -- close current split window

keymap.set('n', '<leader>ta', '<cmd>tabnew<CR>', opts 'Open new tab') -- open new tab
keymap.set('n', '<leader>tx', '<cmd>tabclose<CR>', opts 'Close current tab') -- close current tab
keymap.set('n', '<leader>tn', '<cmd>tabn<CR>', opts 'Go to next tab') --  go to next tab
keymap.set('n', '<leader>tp', '<cmd>tabp<CR>', opts 'Go to previous tab') --  go to previous tab
keymap.set('n', '<leader>tf', '<cmd>tabnew %<CR>', opts 'Open current buffer in new tab') --  move current buffer to new tab

keymap.set('n', '<C-]>', '<cmd>tabn<CR>', opts 'Go to next tab') --  go to next tab
keymap.set('n', '<C-[>', '<cmd>tabp<CR>', opts 'Go to previous tab') --  go to previous tab

keymap.set({ 'v', 'n' }, '<leader>h', '^', opts 'Move to beginning of line')
keymap.set({ 'v', 'n' }, '<leader>l', '$', opts 'Move to end of line')

keymap.set({ 'v', 'n' }, 'J', '5j', { noremap = true, silent = true })
keymap.set({ 'v', 'n' }, 'K', '5k', { nowait = true, noremap = true, silent = true })

-- adding comma to EOL
keymap.set('n', '<C-,>', 'A,', opts 'comma at EOL')

-- shift enter to move to new line
keymap.set('i', '<S-CR>', '<ESC>o', { noremap = true, silent = true })
keymap.set('n', '<S-CR>', 'o<ESC>', { noremap = true, silent = true })

-- yy to only take text
keymap.set('n', 'yy', '^vg_y', { desc = 'Yank line text without newline' })
keymap.set('v', 'p', '"_dhp', opts 'Paste without yanking selection')

-- personal favorites
keymap.set('n', '<C-s>', ':w<CR>', opts())
keymap.set('n', '<C-a>', 'ggVG', opts())

-- navigation
keymap.set('n', '<C-d>', '<C-d>zz', opts())
keymap.set('n', '<C-u>', '<C-u>zz', opts())
keymap.set('n', '<C-f>', '<C-f>zz', opts())
keymap.set('n', '<C-b>', '<C-b>zz', opts())

keymap.set('n', 'U', 'mzJ`z', opts 'Join in place')

-- search with *
keymap.set('n', '*', 'yiw:let @/=@"<CR>:set hls<CR>zz', opts 'Smart search word under cursor')

-- get filepath
keymap.set('n', '<leader>cP', ':let @+ = expand("%:p")<CR>', opts 'Get full file path')
keymap.set('n', '<leader>cp', ':let @+ = expand("%")<CR>', opts 'Get relative file path')

-- make esc holy
keymap.set('n', '<Esc>', '<Esc>', opts '')
keymap.set('i', '<Esc>', '<Esc>', opts '')
keymap.set('v', '<Esc>', '<Esc>', opts '')

-- for zerg like tab switching
for i = 1, 6 do
  vim.keymap.set('n', '<F' .. i .. '>', function()
    local tab_count = #vim.api.nvim_list_tabpages()
    local current_buf = vim.api.nvim_get_current_buf()

    -- Create new tabs if needed
    if tab_count < i then
      for _ = tab_count + 1, i do
        vim.cmd 'tabnew' -- Create new tab
        vim.api.nvim_set_current_buf(current_buf) -- Set current buffer in new tab
      end
    end

    -- Go to the requested tab
    vim.cmd(i .. 'tabnext')
  end, { desc = 'Go to or create tab ' .. i .. ' with current buffer' })
end
