(module magic.plugin.vim-easy-align
  {autoload {nvim aniseed.nvim}})

(nvim.ex.xmap :ga "<Plug>(EasyAlign)")
(nvim.ex.nmap :ga "<Plug>(EasyAlign)")
