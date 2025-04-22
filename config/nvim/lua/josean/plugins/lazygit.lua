return {
  "kdheepak/lazygit.nvim",
  cmd = {
    "LazyGit",
    "LazyGitConfig",
    "LazyGitCurrentFile",
    "LazyGitFilter",
    "LazyGitFilterCurrentFile",
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  keys = {
    {
      "<D-G>", -- Correct key representation for Command+G
      "<cmd>LazyGit<CR>",
      mode = "n", -- normal mode
      desc = "Open LazyGit",
    },
  },
}
