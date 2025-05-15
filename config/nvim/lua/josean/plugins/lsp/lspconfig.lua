return {
  'neovim/nvim-lspconfig',
  event = { 'BufReadPre', 'BufNewFile' },
  dependencies = {
    'hrsh7th/cmp-nvim-lsp',
    { 'antosha417/nvim-lsp-file-operations', config = true },
    { 'folke/neodev.nvim', opts = {} },
  },
  config = function()
    -- import lspconfig plugin
    local lspconfig = require 'lspconfig'

    -- import mason_lspconfig plugin
    local mason_lspconfig = require 'mason-lspconfig'

    -- import cmp-nvim-lsp plugin
    local cmp_nvim_lsp = require 'cmp_nvim_lsp'

    local util = require 'lspconfig.util'
    lspconfig.pyright.setup {
      settings = {
        python = {
          pythonpath = { vim.fn.exepath 'python3' },
          analysis = {
            autosearchpaths = true,
            diagnosticmode = 'openfilesonly',
            uselibrarycodefortypes = true,
          },
        },
      },
    }
    lspconfig.lua_ls.setup {
      root_dir = function(fname)
        local root = util.root_pattern('.git', '.luarc.json', '.luarc.jsonc')(fname)
        if root == nil then
          return vim.fn.fnamemodify(fname, ':p:h')
        end
        return root
      end,
    }
    lspconfig.angularls.setup {
      cmd = {
        'ngserver',
        '--stdio',
        '--tsprobelocations',
        '/users/alean/.local/share/fnm/node-versions/v20.19.0/installation/lib/node_modules', -- adjust to match your global npm path
        '--ngprobelocations',
        '/users/alean/.local/share/fnm/node-versions/v20.19.0/installation/lib/node_modules',
      },
      filetypes = { 'typescript', 'html' },
      root_dir = lspconfig.util.root_pattern('angular.json', 'project.json'),
    }
    local keymap = vim.keymap -- for conciseness

    vim.api.nvim_create_autocmd('lspattach', {
      group = vim.api.nvim_create_augroup('userlspconfig', {}),
      callback = function(ev)
        -- buffer local mappings.
        -- see `:help vim.lsp.*` for documentation on any of the below functions
        local opts = { buffer = ev.buf, silent = true, noremap = true }

        -- set keybinds
        opts.desc = 'show lsp references'
        keymap.set('n', 'gr', '<cmd>Telescope lsp_references<cr>', opts) -- show definition, references

        opts.desc = 'go to declaration'
        keymap.set('n', 'gd', vim.lsp.buf.declaration, opts) -- go to declaration

        opts.desc = 'show lsp definitions'
        keymap.set('n', 'gd', '<cmd>Telescope lsp_definitions<cr>', opts) -- show lsp definitions

        opts.desc = 'show lsp implementations'
        keymap.set('n', 'gi', '<cmd>Telescope lsp_implementations<cr>', opts) -- show lsp implementations

        opts.desc = 'show lsp type definitions'
        keymap.set('n', 'gt', '<cmd>Telescope lsp_type_definitions<cr>', opts) -- show lsp type definitions

        opts.desc = 'see available code actions'
        keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, opts) -- see available code actions, in visual mode will apply to selection

        opts.desc = 'smart rename'
        keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts) -- smart rename

        opts.desc = 'show buffer diagnostics'
        keymap.set('n', '<leader>D', '<cmd>Telescope diagnostics bufnr=0<cr>', opts) -- show  diagnostics for file

        opts.desc = 'show line diagnostics'
        keymap.set('n', '<leader>d', vim.diagnostic.open_float, opts) -- show diagnostics for line

        opts.desc = 'go to previous diagnostic'
        opts.desc = 'show documentation for what is under cursor'
        keymap.set('n', 'gh', vim.lsp.buf.hover, opts) -- show documentation for what is under cursor

        opts.desc = 'restart lsp'
        keymap.set('n', '<leader>rs', ':lsprestart<cr>', opts) -- mapping to restart lsp if necessary
      end,
    })

    -- used to enable autocompletion (assign to every lsp server config)
    local capabilities = cmp_nvim_lsp.default_capabilities()

    -- change the diagnostic symbols in the sign column (gutter)
    -- (not in youtube nvim video)

    vim.api.nvim_set_hl(0, 'diagnosticsignerror', { link = 'error' })
    vim.api.nvim_set_hl(0, 'diagnosticsignwarn', { link = 'warningmsg' })
    vim.api.nvim_set_hl(0, 'diagnosticsignhint', { link = 'hint' })
    vim.api.nvim_set_hl(0, 'diagnosticsigninfo', { link = 'information' })
    vim.diagnostic.config {
      signs = {
        text = {
          [vim.diagnostic.severity.ERROR] = ' ',
          [vim.diagnostic.severity.WARN] = ' ',
          [vim.diagnostic.severity.HINT] = '󰠠 ',
          [vim.diagnostic.severity.INFO] = ' ',
        },
      },
    }

    mason_lspconfig.setup {
      ensure_installed = { 'angularls', 'gopls' },
      automatic_installation = true,
    }
    mason_lspconfig.setup_handlers {
      function(server_name)
        lspconfig[server_name].setup {}
      end,
    }
  end,
}
