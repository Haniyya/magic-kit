(module magic.plugin.conjure
  {autoload {nvim aniseed.nvim
             util magic.util}})

(set nvim.g.conjure#filetypes
   ["clojure" "fennel" "janet" "hy" "julia" "racket" "scheme" "lua" "lisp" "python"])
