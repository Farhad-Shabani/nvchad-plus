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
    local bufs = vim.t.bufs
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
    vim.cmd [[
      " Better visibility for Git diffs in OneDark theme
      highlight DiffAdd      guibg=#1e2a2e guifg=#a3be8c gui=NONE
      highlight DiffChange   guibg=#242a30 guifg=#abb2bf gui=NONE
      highlight DiffDelete   guibg=#2a1e1f guifg=#e06c75 gui=NONE
      highlight DiffText     guibg=#4a2f00 guifg=#ffcc66 gui=NONE
    ]]
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
