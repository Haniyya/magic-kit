(module magic.plugin.telescope
  {autoload {nvim aniseed.nvim
             util magic.util}})

(def mappings
  [
   ["app/(.*).rb"
    [["spec/[1]_spec.rb" :Spec true]]]
   ["lib/(.*).rb"
    [["spec/lib/[1]_spec.rb" :Spec true]]]
   ["spec/lib/(.*)_spec.rb"
    [["lib/[1].rb" :Original true]]]
   ["app/transfer_objects/(.*)/(.*)_export_to.rb"
    [["app/transfer_objects/[1]/[2]_to.rb" :Original]]]
   ["app/transfer_objects/(.*)/(.*)_input_to.rb"
    [["app/transfer_objects/[1]/[2]_to.rb" :Original]]]
   ["app/transfer_objects/(.*)/(.*)_to.rb"
    [["app/transfer_objects/[1]/[2]_input_to.rb" :InputTO]
     ["app/transfer_objects/[1]/[2]_export_to.rb" :ExportTO]
     ["spec/factories/transfer_objects/[1]_[2]_to.rb" :Factory true]
     ["spec/factories/transfer_objects/[1]_[2]_export_to.rb" :ExportFactory true]
     ["spec/factories/transfer_objects/[1]_[2]_input_to.rb" :InputFactory true]]]])

(defn- tmap [from action]
  (util.lnnoremap from (.. "Telescope " action)))

(let [(ok? telescope) (pcall #(require :telescope))
      (alternate-ok? alternate) (pcall #(require :telescope-alternate))
      (tabs-ok? tabs) (pcall #(require :telescope-tabs))]
  (when tabs-ok? (tabs.setup))
  (when alternate-ok?
    (alternate.setup {:presets [:rails :rspec] :mappings mappings}))
  (when ok?
    (telescope.setup
      {:extensions
       {:file_browser
        {:theme "ivy"}}
       :defaults
       {:vimgrep_arguments ["rg" "--color=never" "--no-heading"
                            "--with-filename" "--line-number" "--column"
                            "--smart-case" "--hidden" "--follow"
                            "-g" "!.git/"]}})
    (telescope.load_extension "file_browser")
    (telescope.load_extension "telescope-alternate")

    (tmap :ff "find_files hidden=true")
    (tmap :f- "file_browser")
    (tmap "f0" "file_browser path=%:p:h") ; Open file browser in files directory
    (tmap :fg "live_grep")
    (tmap :* "grep_string")
    (tmap :fb "buffers")
    (tmap :fH "help_tags")
    (tmap :fm "keymaps")
    (tmap :fM "marks")
    (tmap :fh "oldfiles")
    (tmap :fts "treesitter")
    (tmap :ft "telescope-tabs list_tabs")
    (tmap :fc "commands")
    (tmap :fC "command_history")
    (tmap :fq "quickfix")
    (tmap :fl "loclist")
    (tmap :fa "telescope-alternate alternate_file")
    ;(tmap :fsa "lsp_code_actions") Broken for now
    (tmap :fsi "lsp_implementations")
    (tmap :fsr "lsp_references")
    (tmap :fsS "lsp_document_symbols")
    (tmap :fss "lsp_workspace_symbols")))
