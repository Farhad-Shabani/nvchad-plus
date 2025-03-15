local autocmd = vim.api.nvim_create_autocmd
local autogroup = vim.api.nvim_create_augroup

-- Auto reload on focus gain in Cairo
autocmd({ "FocusGained", "BufEnter", "CursorHold" }, {
  pattern = "*",
  callback = function()
    local filetypes = { "cairo" }
    if vim.tbl_contains(filetypes, vim.bo.filetype) then
      vim.cmd "checktime"
    end
  end,
})

autocmd("BufWritePre", {
  pattern = "*.rs",
  callback = function()
    vim.lsp.buf.format { async = false }
  end,
})

autocmd("BufDelete", {
  callback = function()
    local bufs = vim.t.bufs or {}
    if #bufs == 1 and vim.api.nvim_buf_get_name(bufs[1]) == "" then
      vim.cmd "Nvdash"
    end
  end,
})

autocmd("BufReadPost", {
  pattern = "*",
  callback = function()
    local line = vim.fn.line "'\""
    if
      line > 1
      and line <= vim.fn.line "$"
      and vim.bo.filetype ~= "commit"
      and vim.fn.index({ "xxd", "gitrebase" }, vim.bo.filetype) == -1
    then
      vim.cmd 'normal! g`"'
    end
  end,
})

autocmd("User", {
  pattern = "*",
  callback = function()
    require("configs.git").diff_hl()
  end,
})

-- Set configs for markdown files
autogroup("MarkdownSettings", { clear = true })
autocmd("FileType", {
  group = "MarkdownSettings",
  pattern = { "markdown", "text" },
  callback = function()
    vim.opt_local.textwidth = 80
    vim.opt_local.formatoptions:append "t"
  end,
})

-- MDsveX
local mdsvex_group = autogroup("MDsveX_Config", { clear = true })
autocmd({ "BufNewFile", "BufRead" }, {
  pattern = "*.svx",
  command = "set filetype=markdown",
  group = mdsvex_group,
})
autocmd({ "BufNewFile", "BufRead" }, {
  pattern = "*.svx",
  command = "set syntax=markdown",
  group = mdsvex_group,
})
