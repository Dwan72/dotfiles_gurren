local function opts(desc)
  return {
    silent = true,
    desc = desc,
  }
end
return {
  {
    'rcarriga/nvim-dap-ui',
    dependencies = {
      { 'mfussenegger/nvim-dap' },
      {
        'mxsdev/nvim-dap-vscode-js',
        opts = {
          debugger_path = vim.fn.stdpath 'data' .. '/lazy/vscode-js-debug',
          adapters = { 'pwa-node', 'pwa-chrome', 'pwa-msedge', 'node-terminal', 'pwa-extensionHost' },
        },
      },
      {
        'microsoft/vscode-js-debug',
        version = '1.x',
        build = 'rm -rf out/dist && npm ci && npm run compile vsDebugServerBundle && mv dist out',
      },
    },
    keys = {
      { '<localleader>dc', [[:lua require('dap').continue()<cr>]], opts 'Dap continue' },
      { '<localleader>do', [[:lua require('dap').step_over()<cr>]], opts 'step over' },
      { '<localleader>di', [[:lua require('dap').step_into()<cr>]], opts 'Dap step into' },
      { '<localleader>dt', [[:lua require('dap').step_out()<cr>]], opts 'Dap step out' },
      { '<localleader>db', [[:lua require('dap').toggle_breakpoint()<cr>]], opts 'Dap toggle breakpoint' },
      {
        '<localleader>dB',
        [[:lua require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: '))<cr>]],
        opts 'Dap set breakpoint',
      },
      { '<localleader>dr', [[:lua require('dap').repl_open()<cr>]], opts 'Dap repl_open' },
      { '<localleader>du', [[:lua require('dapui').toggle()<cr>]], opts 'Dap UI toggle' },
    },
    config = function()
      local dap = require 'dap'
      local dapui = require 'dapui'

      dapui.setup()

      for _, language in ipairs { 'typescriptreact', 'typescript', 'javascript', 'vue' } do
        require('dap').configurations[language] = {
          {
            type = 'pwa-node',
            request = 'attach',
            name = 'Attach debugger to existing `node --inspect` process',
            resolveSourceMapLocations = { '${workspaceFolder}/**', '!**/node_modules/**' },
            cwd = '${workspaceFolder}',
            -- we don't want to debug code inside node_modules, so skip it!
            skipFiles = { '<node_internals>/**', '${workspaceFolder}/node_modules/**' },
          },
          {
            type = 'pwa-chrome',
            name = 'Launch Chrome to debug client',
            request = 'launch',
            url = 'http://localhost:3000',
            sourceMaps = true,
            protocol = 'inspector',
            port = 9222,
            webRoot = '${workspaceFolder}/src',
            -- skip files from vite's hmr
            skipFiles = { '**/node_modules/**/*', '**/@vite/*', '**/src/client/*', '**/src/*' },
          },

          {
            type = 'pwa-node',
            name = 'Attach to testing',
            port = 9232,
            request = 'attach',
            skipFiles = { '<node_internals>/**', '**/node_modules/**' },
            outFiles = { '${workspaceFolder}/dist/**/*.js' },
            cwd = '${workspaceFolder}',
          },

          {
            type = 'pwa-node',
            name = 'Attach Service Platform',
            port = 9231,
            request = 'attach',
            skipFiles = { '<node_internals>/**', '**/node_modules/**' },
            outFiles = { '${workspaceFolder}/service-platform/dist/**/*.js' },
            -- localRoot DOES NOT WORK in Neovim for some reason, but it works in VSCode
            localRoot = '${workspaceFolder}/service-platform',
            remoteRoot = '${workspaceFolder}/service-platform',
            cwd = '${workspaceFolder}/service-platform',
          },
          {
            name = 'Attach Service SD',
            port = 9230,
            request = 'attach',
            skipFiles = { '<node_internals>/**', '**/node_modules/**' },
            type = 'pwa-node',
            outFiles = { '${workspaceFolder}/service-sd/dist/**/*.js' },
            localRoot = '${workspaceFolder}/service-sd',
            remoteRoot = '${workspaceFolder}/service-sd',
            cwd = '${workspaceFolder}/service-sd',
          },
        }
      end

      vim.fn.sign_define('DapBreakpoint', { text = '⬤', texthl = 'DapBreakpoint', linehl = '', numhl = '' })
      vim.fn.sign_define('DapStopped', { text = '→', texthl = 'DapStopped', linehl = '', numhl = '' })

      dap.listeners.after.event_initialized['dapui_config'] = function()
        dapui.open { reset = true }
      end
      dap.listeners.before.event_terminated['dapui_config'] = dapui.close
      dap.listeners.before.event_exited['dapui_config'] = dapui.close
    end,
  },
}
