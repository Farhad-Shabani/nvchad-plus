<div align="center">
    <h1>NvChad Plus</h1>
</div>

This repository extends [NvChad](https://github.com/NvChad/NvChad) with additional plugins and configurations for an enhanced Neovim experience.

## 📌 Prerequisites

- **Neovim** ≥ 0.10
- **Github CLI** ≥  2.2.0
- **System Requirements:** `grep`, `Node.js` ≥ 18, `npm`, and `yarn`

## 🔌 Additional Plugins

- **Finder**: `telescope.nvim` extended with `live_grep_args`, `fzf`, `frequency`, `file_browser`
- **Navigation**: `harpoon`
- **Editing**: `nvim-treesitter-context`, `nvim-surround`, `nvim-rip-substitute`, `nvim-ts-autotag`
- **Debugging**: `nvim-dap`, `nvim-dap-ui`, `trouble.nvim`, `nvim-chainsaw`
- **Git**: `lazygit`, `octo.nvim`, `neogit`, `diffview.nvim`, `git-conflict.nvim`, `vim-fugitive`, `vim-rhubarb`
- **Rust**: `rustaceanvim`, `crates.nvim`
- **Markdown**: `markdown-preview`, `render-markdown`
- **Coding Assistant**: `Avante`

## 🌍 Language Support

- Rust, Cairo, Circom, Deno, TypeScript, JavaScript, JSX, TSX, Svelte, TailwindCSS, HTML

## 🎹 Keymaps

This configuration includes a set of custom key mappings for enhance workflow.
For the full list refer to the [`mappings.lua`](lua/mappings.lua) file.

## 🛠️ Customization

### lazygit - edit files in same process

Use an alias to start nvim with the `--listen` parameter:

```bashrc
# ~/.bashrc
alias vim='nvim --listen /tmp/nvim-server.pipe'
```


Modify lazygit to attempt connecting to existing nvim instance on edit:

```
# Linux: ~/.config/lazygit/config.yml
# MacOS: ~/Library/Application\ Support/lazygit/config.yml
os:
  editCommand: 'nvim'
  editCommandTemplate: '{{editor}} --server /tmp/nvim-server.pipe --remote-tab "{{filename}}"'
```

