(module magic.plugin.fugitive
  {autoload {nvim aniseed.nvim}
   require-macros [magic.macros]})

(augroup :fugitive
  (vim.cmd "autocmd FileType fugitiveblame noremap <buffer> K :Git show<CR>"))
