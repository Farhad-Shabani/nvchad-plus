local g = vim.g

g.base46_cache = vim.fn.stdpath "data" .. "/nvchad/base46/"
g.mapleader = " "
g.maplocalleader = "\\"

-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not vim.uv.fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
end

vim.opt.rtp:prepend(lazypath)

local lazy_config = require "configs.lazy"

-- load plugins
require("lazy").setup({
  {
    "NvChad/NvChad",
    lazy = false,
    branch = "v2.5",
    import = "nvchad.plugins",
  },
  { import = "plugins" },
}, lazy_config)

require "nvchad.options"
require "options"
require "nvchad.autocmds"
require "autocmds"
vim.schedule(function()
  require "mappings"
end)
require "configs.conform"
require "configs.lspconfig"
require "configs.treesitter"
