local actions = require "telescope.actions"
local lga_actions = require "telescope-live-grep-args.actions"
local defaults = require "nvchad.configs.telescope"
local configs = {
  defaults = {
    mappings = {
      i = { ["<c-t>"] = require("trouble.sources.telescope").open },
      n = { ["<c-t>"] = require("trouble.sources.telescope").open },
    },
  },
  extensions = {
    fuzzy = true,
    fzf = {},
    live_grep_args = {
      auto_quoting = true, -- enable/disable auto-quoting
      -- define mappings, e.g.
      mappings = { -- extend mappings
        i = {
          ["<C-k>"] = lga_actions.quote_prompt(),
          ["<C-i>"] = lga_actions.quote_prompt { postfix = " --iglob " },
          -- freeze the current list and start a fuzzy search in the frozen list
          ["<C-space>"] = actions.to_fuzzy_refine,
        },
      },
      -- ... also accepts theme settings, for example:
      -- theme = "dropdown", -- use dropdown theme
      -- theme = { }, -- use own theme spec
      -- layout_config = { mirror=true }, -- mirror preview pane
    },
  },
  extension_list = { "live_grep_args", "fzf", "frequency", "file_browser", "lazygit" },
}

return vim.tbl_deep_extend("force", defaults, configs)
