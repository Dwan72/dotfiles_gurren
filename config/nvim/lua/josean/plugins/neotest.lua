return {
  'nvim-neotest/neotest',
  lazy = true,
  dependencies = {
    'nvim-neotest/nvim-nio',
    'nvim-lua/plenary.nvim',
    'antoinemadec/FixCursorHold.nvim',
    'nvim-treesitter/nvim-treesitter',
    'nvim-neotest/neotest-jest',
  },
  opts = {
    adapters = {
      ['neotest-jest'] = {
        jestConfigFile = function(path)
          return require('utils.path').get_project_root(path) .. 'jest.config.ts'
        end,
        env = { CI = true },
        cwd = function(path)
          return require('utils.path').get_project_root(path)
        end,
      },
    },
  },
  -- stylua: ignore
  keys = {
    { "<leader>t",  "", desc = "+test" },
    { "<leader>tt", function() require("neotest").run.run(vim.fn.expand("%")) end,              desc = "Run File" },
    { "<leader>tr", function() require("neotest").run.run() end,                                desc = "Run Nearest" },
    { "<leader>ts", function() require("neotest").summary.toggle() end,                         desc = "Toggle Summary" },
    { "<leader>to", function() require("neotest").output.open({ enter = true, auto_close = true }) end, desc = "Show Output" },
    { "<leader>tO", function() require("neotest").output_panel.toggle() end,                    desc = "Toggle Output Panel" },
    { "<leader>tS", function() require("neotest").run.stop() end,                               desc = "Stop" },
    { "<leader>tw", function() require("neotest").watch.toggle(vim.fn.expand("%")) end,         desc = "Toggle Watch" },
  },
  config = function()
    local neotest = require 'neotest'

    local neojest = require 'neotest-jest'
    require('neotest').setup {
      adapters = {
        require 'neotest-jest' {
          discovery = { enabled = false },
          jestCommand = 'node node_modules/.bin/jest',
          jestConfigFile = 'jest.config.ts',
          env = { CI = true },
          cwd = function(path)
            return vim.fn.getcwd()
          end,
        },
      },
    }
    function CopyNeotestCommand()
      -- Get the nearest test position
      local client = require('neotest').client
      local position = client:get_nearest()
      if not position then
        print 'No test found.'
        return
      end
      -- Get the adapter for the position
      local adapter = require('neotest').run.get_adapter(position:data().id)
      local spec = adapter.build_spec(position)
      if not adapter then
        print 'No adapter found for test.'
        return
      end
      -- Copy command to system clipboard
      vim.fn.setreg('+', spec.command)
      print('Copied test command to clipboard: ' .. spec.command)
    end

    -- Keymap for it
    vim.keymap.set('n', '<leader>tc', CopyNeotestCommand, { desc = 'Copy neotest command' })
  end,
}
