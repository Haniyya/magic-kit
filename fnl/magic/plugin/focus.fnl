(module magic.plugin.focus
  {autoload {nvim aniseed.nvim}})

(let [(ok? focus) (pcall #(require :focus))]
 (when ok?
   (focus.setup)))
