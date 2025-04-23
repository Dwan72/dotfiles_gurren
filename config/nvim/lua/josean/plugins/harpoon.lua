return {
  'ThePrimeagen/harpoon',
  branch = 'harpoon2',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    local harpoon = require 'harpoon'
    harpoon:setup {}

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

    vim.keymap.set('n', '<leader>p', function()
      toggle_telescope(harpoon:list())
    end, opts_with_desc('Harpoon list', { nowait = true }))

    vim.keymap.set('n', '<C-o>', function()
      harpoon:list():add()
    end, opts_with_desc 'Harpoon add to list')

    -- ✨ UPDATED: <leader> goes to file
    vim.keymap.set('n', '<leader>1', function()
      harpoon:list():select(1)
    end, opts_with_desc 'Harpoon go to 1')

    vim.keymap.set('n', '<leader>2', function()
      harpoon:list():select(2)
    end, opts_with_desc 'Harpoon go to 2')

    vim.keymap.set('n', '<leader>3', function()
      harpoon:list():select(3)
    end, opts_with_desc 'Harpoon go to 3')

    vim.keymap.set('n', '<leader>4', function()
      harpoon:list():select(4)
    end, opts_with_desc 'Harpoon go to 4')
  end,
}
