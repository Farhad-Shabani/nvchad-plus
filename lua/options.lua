local g = vim.g
local o = vim.o

g.base46_cache = vim.fn.stdpath "data" .. "/nvchad/base46/"
g.mapleader = " "
g.maplocalleader = "\\"
g.markdown_fenced_languages = {
  "ts=typescript",
}

-- load theme
dofile(g.base46_cache .. "defaults")
dofile(g.base46_cache .. "statusline")

o.clipboard = "unnamedplus"
o.cursorlineopt = "both"
o.relativenumber = true
o.number = true
o.ruler = true
o.autoread = true
o.mouse = "a"

local autocmd = vim.api.nvim_create_autocmd

autocmd("FileType", {
  pattern = { "markdown", "text", "gitcommit" },
  callback = function()
    vim.opt_local.spell = true
    vim.opt_local.spelllang = "en_us"
    vim.opt_local.spelloptions = "camel"
  end,
})

autocmd("FileType", {
  pattern = { "terminal" },
  callback = function()
    vim.opt_local.spell = false
  end,
})
