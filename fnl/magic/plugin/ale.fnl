(module magic.plugin.ale
  {autoload {nvim aniseed.nvim}})

(set nvim.g.ale_linters
  {:ruby []
   :clojure [:clj-kondo :joker]
   :haskell []})

(set nvim.g.ale_fix_on_save true)

(set nvim.g.ale_fixers {:haskell [:hindent]})
