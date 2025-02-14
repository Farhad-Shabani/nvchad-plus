local M = {}

function M.telescope()
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
end

function M.toggle_harpoon(harpoon_files)
  local finder = function()
    local paths = {}
    for _, item in ipairs(harpoon_files.items) do
      table.insert(paths, item.value)
    end

    return require("telescope.finders").new_table {
      results = paths,
    }
  end

  require("telescope.pickers")
    .new({}, {
      prompt_title = "Harpoon",
      finder = finder(),
      previewer = false,
      sorter = require("telescope.config").values.generic_sorter {},
      layout_config = {
        height = 0.4,
        width = 0.5,
        prompt_position = "top",
        preview_cutoff = 120,
      },
      attach_mappings = function(prompt_bufnr, map)
        map({ "i", "n" }, "<C-d>", function()
          local state = require "telescope.actions.state"
          local selected_entry = state.get_selected_entry()
          local current_picker = state.get_current_picker(prompt_bufnr)

          table.remove(harpoon_files.items, selected_entry.index)
          current_picker:refresh(finder())
        end)
        return true
      end,
    })
    :find()
end

return M
