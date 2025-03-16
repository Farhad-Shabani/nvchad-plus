return {
  {
    "saghen/blink.cmp",
    dependencies = "rafamadriz/friendly-snippets",

    version = "v0.*",

    opts = {
      completion = {
        list = { selection = { preselect = true, auto_insert = true } },

        menu = {
          -- nvim-cmp style menu
          draw = {
            treesitter = { "lsp" },
            columns = {
              { "label", "label_description", gap = 1 },
              { "kind_icon", "kind" },
            },
          },
        },

        -- Show documentation when selecting a completion item
        documentation = { auto_show = true, auto_show_delay_ms = 500 },
      },

      keymap = { preset = "default", ["<CR>"] = { "accept", "fallback" } },

      cmdline = {
        keymap = {
          -- recommended, as the default keymap will only show and select the next item
          ["<Tab>"] = { "show", "accept" },
        },
        completion = { menu = { auto_show = true } },
      },

      appearance = {
        use_nvim_cmp_as_default = true,
      },

      fuzzy = { implementation = "prefer_rust_with_warning" },

      signature = { enabled = true },
    },
  },

  {
    "hrsh7th/nvim-cmp",
    enabled = false,
  },
}
