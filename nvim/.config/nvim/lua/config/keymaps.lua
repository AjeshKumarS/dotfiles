-- MAPS --------------------------------------------------{{{

vim.cmd("imap jj <esc>")
vim.cmd("nnoremap <S-Left> <cmd>BufferLineMovePrev<CR>")
vim.cmd("nnoremap <S-Right> <cmd>BufferLineMoveNext<CR>")
vim.cmd("nnoremap <S-Up> <cmd>m-2<CR>")
vim.cmd("nnoremap <S-Down> <cmd>m+<CR>")
vim.cmd("vnoremap K <esc>'<V'>dkP`[V`]=gv")
vim.cmd("vnoremap J <esc>'<V'>dp`[V`]=gv")
vim.keymap.set("n", "<C-n>", "<cmd>Neotree filesystem reveal left<CR>", {})

-- }}}
