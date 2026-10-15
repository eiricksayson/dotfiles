return {
  {
    "folke/snacks.nvim",
    -- explorer disabled: replaced by nvim-tree.lua for native compact/grouped
    -- empty-folder support (Snacks has no equivalent setting)
    opts = {
      explorer = { enabled = false },
      picker = {
        sources = {
          files = { hidden = true },
        },
      },
    },
    -- unmap LazyVim's default snacks explorer keys so nvim-tree.lua's
    -- <leader>e / <leader>E bindings actually win
    keys = {
      { "<leader>e", false },
      { "<leader>E", false },
      { "<leader>fe", false },
      { "<leader>fE", false },
    },
  },
}
