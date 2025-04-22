return {
  "mg979/vim-visual-multi",
  branch = "master",
  lazy = false, -- or true if you want to lazy load it
  init = function()
    vim.g.VM_default_mappings = 1 -- enables <C-n> to select next occurrence, etc.
    vim.g.VM_maps = {
      ["Find Under"] = "<C-n>", -- like Cmd+D
      ["Find Subword Under"] = "<C-n>",
    }
  end,
}
