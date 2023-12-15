(module magic.plugin.lspconfig
  {autoload {util magic.util
             nvim aniseed.nvim}})

(defn- map [from to]
  (util.nnoremap from to))

(let [(ok? lsp) (pcall #(require :lspconfig))
      (ok? schemas) (pcall #(require :schemastore))]
  (when ok?
    (lsp.texlab.setup {})
    (lsp.clojure_lsp.setup {})
    (lsp.tsserver.setup {})
    (lsp.vuels.setup {})
    (lsp.gopls.setup {})
    (lsp.rust_analyzer.setup {})
    (lsp.hls.setup {})
    (lsp.marksman.setup {})
    (lsp.elmls.setup {})
    (lsp.jsonls.setup
      {:settings {:json {:schemas (schemas.json.schemas)
                         :validate {:enable true}}}})
    (lsp.yamlls.setup
      {:settings {:yaml {:schemaStore {:enable false :url ""}
                         :schemas (schemas.yaml.schemas)}}})
    (lsp.solargraph.setup
      { :solargraph {:diagnostics false}})
    (lsp.lua_ls.setup
      {:cmd ["lua-language-server"]
       :settings {:Lua {:telemetry {:enable false} :diagnostics {:globals [:vim]}}}})

    ;; https://www.chrisatmachine.com/Neovim/27-native-lsp/
    (map :gd "lua vim.lsp.buf.definition()")
    (map :gD "lua vim.lsp.buf.declaration()")
    ;(map :gr "lua vim.lsp.buf.references()")
    (map :gi "lua vim.lsp.buf.implementation()")
    ;(map :K "lua vim.lsp.buf.hover()")
    (map :<c-k> "lua vim.lsp.buf.signature_help()")
    (map :<c-p> "lua vim.diagnostic.goto_prev()")
    (map :<c-n> "lua vim.diagnostic.goto_next()")

    (map :<leader>lr "lua vim.lsp.buf.rename()")
    (map :<leader>lf "lua vim.lsp.buf.formatting()")))
