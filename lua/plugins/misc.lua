return {
  {
    "iden3/vim-circom-syntax",
    ft = { "circom" },
  },

  { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },

  {
    "HakonHarnes/img-clip.nvim",
    opts = {},
    keys = {
      { "<leader>pi", "<cmd>PasteImage<cr>", desc = "Paste image from system clipboard" },
    },
  },
}
