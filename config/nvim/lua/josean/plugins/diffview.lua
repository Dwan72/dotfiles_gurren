return {
  'sindrets/diffview.nvim',
  cmd = 'DiffviewOpen',
  cond = function()
    -- Assuming is_git_root was a function to check if current directory is a git repository
    local function is_git_repo()
      local result = vim.fn.system 'git rev-parse --is-inside-work-tree'
      return vim.v.shell_error == 0
    end
    return is_git_repo()
  end,
  keys = {
    {
      '<leader>gd',
      function()
        local function toggle_diffview(cmd)
          if next(require('diffview.lib').views) == nil then
            vim.cmd(cmd)
          else
            vim.cmd 'DiffviewClose'
          end
        end
        toggle_diffview 'DiffviewOpen'
      end,
      desc = 'Diff Index',
    },
    {
      '<leader>gD',
      function()
        local function toggle_diffview(cmd)
          if next(require('diffview.lib').views) == nil then
            vim.cmd(cmd)
          else
            vim.cmd 'DiffviewClose'
          end
        end
        toggle_diffview 'DiffviewOpen master..HEAD'
      end,
      desc = 'Diff master',
    },
    {
      '<leader>gf',
      function()
        local function toggle_diffview(cmd)
          if next(require('diffview.lib').views) == nil then
            vim.cmd(cmd)
          else
            vim.cmd 'DiffviewClose'
          end
        end
        toggle_diffview 'DiffviewFileHistory %'
      end,
      desc = 'Open diffs for current File',
    },
  },
}
