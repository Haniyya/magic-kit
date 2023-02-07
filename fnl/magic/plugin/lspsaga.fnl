(module magic.plugin.lspsaga
  {autoload {util magic.util
             nvim aniseed.nvim}})

(defn- map [mode from action]
  (vim.keymap.set mode from (.. "<cmd>Lspsaga " action "<CR>")))

(let [(ok? lspsaga) (pcall require :lspsaga)]
  (when ok?
    (lspsaga.setup {})
    (map :n :gh :lsp_finder)
    (map :n :gr "rename ++project")
    (map :n :K :hover_doc)
    (map [:n :v] :<leader>ca :code_action)
    (map :n :<leader>o :outline)
    (map :n :<leader>ci :incoming_calls)
    (map :n :<leader>co :outgoing_calls)))
