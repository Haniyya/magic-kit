(module magic.plugin.lsp_signature
  {autoload {util magic.util
             nvim aniseed.nvim}})

(let [(ok? lsp) (pcall #(require :lsp_signature))]
  (when ok?
    (lsp.setup {:toggle_key "<C-s>"})))

