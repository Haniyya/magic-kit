(module magic.plugin.vim-test
  {autoload {nvim aniseed.nvim
             util magic.util}})

(set nvim.g.test#strategy :dispatch)

(util.llnnoremap "f" "TestFile")
(util.llnnoremap "t" "TestNearest")
(util.llnnoremap "s" "TestSuite")
(util.llnnoremap "g" "TestVisit")
(util.llnnoremap "l" "TestLast")
