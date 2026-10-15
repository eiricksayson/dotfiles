return {
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    cmd = { "NvimTreeToggle", "NvimTreeFocus" },
    keys = {
      { "<leader>e", "<cmd>NvimTreeOpen<CR>", desc = "Explorer NvimTree (root dir)" },
      { "<leader>E", "<cmd>NvimTreeFindFileToggle<CR>", desc = "Explorer NvimTree (reveal current file)" },
    },
    opts = {
      -- show current buffer's file highlighted/scrolled-to automatically
      update_focused_file = {
        enable = true,
        update_root = false,
      },
      filters = {
        -- show dotfiles/hidden files by default
        dotfiles = false,
        git_ignored = false,
      },
      renderer = {
        -- the actual feature we swapped for: combine single-child nested
        -- folders into one compact line (a/b/c instead of 3 levels)
        group_empty = true,
      },
      view = {
        width = 45,
      },
      actions = {
        open_file = {
          -- keep the tree open when opening/previewing a file
          quit_on_open = false,
        },
      },
    },
  },
}