return {
  {
    "iden3/vim-circom-syntax",
    ft = { "circom" },
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
