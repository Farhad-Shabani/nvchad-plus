return {
  {
    "iden3/vim-circom-syntax",
    ft = { "circom" },
  },

  {
    "folke/zen-mode.nvim",
    event = "VeryLazy",
    cmd = { "ZenMode" },
    opts = {
      plugins = {
        options = {
          ruler = true,
          number = true,
          relativenumber = true,
        },
      },
    },
  },

  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    cmd = { "TodoQuickFix", "TodoLocList", "TodoTelescope" },
    opts = {},
  },

  {
    "HakonHarnes/img-clip.nvim",
    opts = {},
    keys = {
      { "<leader>pi", "<cmd>PasteImage<cr>", desc = "Paste image from system clipboard" },
    },
  },
}
