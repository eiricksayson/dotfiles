return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    cmd = "Telescope",
    opts = {
      defaults = {
        -- show hidden files/folders (dotfiles) everywhere, but still skip .git
        vimgrep_arguments = {
          "rg",
          "--color=never",
          "--no-heading",
          "--with-filename",
          "--line-number",
          "--column",
          "--smart-case",
          "--hidden",
          "--glob=!.git/*",
        },
      },
      pickers = {
        find_files = {
          hidden = true,
          no_ignore = false,
          find_command = { "rg", "--files", "--hidden", "--glob", "!.git/*" },
        },
        live_grep = {
          additional_args = function()
            return { "--hidden", "--glob", "!.git/*" }
          end,
        },
      },
    },
    keys = {
      { "<leader>tf", "<cmd>Telescope find_files<cr>", desc = "Telescope: Find Files" },
      { "<leader>tg", "<cmd>Telescope live_grep<cr>", desc = "Telescope: Live Grep" },
      { "<leader>tb", "<cmd>Telescope buffers<cr>", desc = "Telescope: Buffers" },
      { "<leader>th", "<cmd>Telescope help_tags<cr>", desc = "Telescope: Help Tags" },
    },
  },
}
