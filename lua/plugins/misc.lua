return {
  {
    "nvchad/base46",
    branch = "v3.0",
    build = function()
      require("base46").load_all_highlights()
    end,
  },

  {
    "iden3/vim-circom-syntax",
    ft = { "circom" },
  },

  {
    "folke/zen-mode.nvim",
    event = "VeryLazy",
    cmd = { "ZenMode" },
    opts = {
      window = {
        options = {
          ruler = true,
          number = true,
          relativenumber = true,
        },
      },
      plugins = {
        options = {
          showcmd = true,
          laststatus = 3,
        },
      },
      on_open = function(win)
        local view = require "zen-mode.view"
        local layout = view.layout(view.opts)
        vim.api.nvim_win_set_config(win, {
          width = layout.width,
          height = layout.height - 1,
        })
        vim.api.nvim_win_set_config(view.bg_win, {
          width = vim.o.columns,
          height = view.height() - 1,
          row = 1,
          col = layout.col,
          relative = "editor",
        })
      end,
    },
  },

  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    cmd = { "TodoQuickFix", "TodoLocList", "TodoTelescope" },
    config = function()
      dofile(vim.g.base46_cache .. "todo")
      require("todo-comments").setup()
    end,
  },

  {
    "HakonHarnes/img-clip.nvim",
    opts = {},
    keys = {
      { "<leader>pi", "<cmd>PasteImage<cr>", desc = "Paste image from system clipboard" },
    },
  },
}
