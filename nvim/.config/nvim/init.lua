-- bootstrap lazy.nvim, LazyVim and your plugins
--
if vim.g.vscode then
  -- VSCode Neovim
  require("code.keymaps")
else
  require("config.lazy")
end
