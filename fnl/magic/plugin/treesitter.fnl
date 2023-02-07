(module magic.plugin.treesitter
  {autoload {nvim aniseed.nvim
             util magic.util}})

(let [(ok? treesitter) (pcall #(require :nvim-treesitter.configs))]
  (when ok?
    (treesitter.setup
      {:ensure_installed [:ruby :lua :rust :clojure :markdown]
       :auto_install true})))
