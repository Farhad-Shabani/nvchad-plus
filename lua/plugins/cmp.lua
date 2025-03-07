return {
  {
    "hrsh7th/cmp-nvim-lsp",
    enabled = true,
  },

  {
    "hrsh7th/cmp-cmdline",
    lazy = false,
    config = function()
      local cmp = require "cmp"
      cmp.setup.cmdline("/", {
        completion = { completeopt = "menu,menuone,noselect" },
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = "buffer" },
        },
      })
      cmp.setup.cmdline(":", {
        completion = { completeopt = "menu,menuone,noselect" },
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = "path" },
        }, {
          {
            name = "cmdline",
            option = {
              ignore_cmds = { "Man", "!" },
            },
          },
        }),
      })
    end,
  },
}
