(module magic.plugin.nvim-tree
  {autoload {util magic.util}})

(let [(ok? nvim-tree) (pcall require :nvim-tree)]
  (nvim-tree.setup)
  (util.nnoremap :tt :NvimTreeToggle)
  (util.nnoremap :tf :NvimTreeFindFile))
