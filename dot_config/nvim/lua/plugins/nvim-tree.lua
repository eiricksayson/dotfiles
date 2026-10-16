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
      on_attach = function(bufnr)
        local api = require("nvim-tree.api")
        -- keep all of nvim-tree's default keymaps (<CR>, o, etc.)
        api.config.mappings.default_on_attach(bufnr)

        -- live-preview the file under the cursor without leaving the tree;
        -- debounced via a generation token (avoids libuv timer :close() races)
        local preview_gen = 0
        vim.api.nvim_create_autocmd("CursorMoved", {
          buffer = bufnr,
          callback = function()
            preview_gen = preview_gen + 1
            local this_gen = preview_gen
            vim.defer_fn(function()
              if this_gen ~= preview_gen then
                return -- a newer cursor move superseded this one
              end
              local ok, node = pcall(api.tree.get_node_under_cursor)
              if ok and node and node.type == "file" then
                pcall(api.node.open.preview)
              end
            end, 100)
          end,
        })
      end,
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