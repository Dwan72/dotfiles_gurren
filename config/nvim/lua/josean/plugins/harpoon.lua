return {
  'ThePrimeagen/harpoon',
  branch = 'harpoon2',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    local harpoon = require 'harpoon'

    -- Telescope harpoon picker
    local conf = require('telescope.config').values
    local function toggle_telescope(harpoon_files)
      local file_paths = {}
      for _, item in ipairs(harpoon_files.items) do
        table.insert(file_paths, item.value)
      end

      require('telescope.pickers')
        .new({}, {
          prompt_title = 'Harpoon',
          finder = require('telescope.finders').new_table {
            results = file_paths,
          },
          previewer = conf.file_previewer {},
          sorter = conf.generic_sorter {},
        })
        :find()
    end

    -- Keymaps
    local opts = { noremap = true, silent = true }
    local function opts_with_desc(desc, extra_opts)
      return vim.tbl_extend('force', opts, extra_opts or {}, { desc = desc })
    end

    vim.keymap.set('n', '<C-p>', function()
      harpoon.ui:toggle_quick_menu(harpoon:list())
    end, opts_with_desc 'Harpoon toggle quick menu')

    vim.keymap.set('n', '<leader>a', function()
      harpoon:list():add()
    end)

    for _, i in ipairs { 1, 2, 3, 4 } do
      vim.keymap.set('n', '<C-' .. i .. '>', function()
        harpoon:list():select(i)
      end, opts_with_desc('Harpoon go to ' .. i))
    end

    vim.keymap.set('n', '<leader>p', function()
      toggle_telescope(harpoon:list())
    end, opts_with_desc('Harpoon list', { nowait = true }))
  end,
}
