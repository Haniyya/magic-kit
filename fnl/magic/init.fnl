(module magic.init
  {autoload {plugin magic.plugin
             nvim aniseed.nvim}})

;;; Introduction

;; Aniseed compiles this (and all other Fennel files under fnl) into the lua
;; directory. The init.lua file is configured to load this file when ready.

;; We'll use modules, macros and functions to define our configuration and
;; required plugins. We can use Aniseed to evaluate code as we edit it or just
;; restart Neovim.

;; You can learn all about Conjure and how to evaluate things by executing
;; :ConjureSchool in your Neovim. This will launch an interactive tutorial.


;;; Generic configuration

(set nvim.o.termguicolors true)
(set nvim.o.mouse "a")
(set nvim.o.updatetime 500)
(set nvim.o.timeoutlen 500)
(set nvim.o.sessionoptions "blank,curdir,folds,help,tabpages,winsize")
(set nvim.o.inccommand :split)

(nvim.ex.set :spell)
(nvim.ex.set :spelllang)
(set nvim.g.spelllang "de,en")
(nvim.ex.set :list)

(set vim.g.loaded_netrw 1)
(set vim.g.loaded_netrwPlugin 1)


;;; Mappings

(set nvim.g.mapleader " ")
(set nvim.g.maplocalleader ",")


;;; Plugins

;; Run script/sync.sh to update, install and clean your plugins.
;; Packer configuration format: https://github.com/wbthomason/packer.nvim
(plugin.use
  :Olical/aniseed {}
  :Olical/conjure {:mod :conjure}
  :Olical/nvim-local-fennel {}
  :PaterJason/cmp-conjure {}
  :PeterRincker/vim-argumentative {}
  :airblade/vim-gitgutter {}
  :clojure-vim/clojure.vim {}
  :ray-x/lsp_signature.nvim {:mod :lsp_signature}
  :LukasPietzschmann/telescope-tabs {}
  :clojure-vim/vim-jack-in {}
  :folke/which-key.nvim {:mod :which-key}
  :ggandor/lightspeed.nvim {}
  :guns/vim-sexp {:mod :sexp}
  :nvim-treesitter/nvim-treesitter {:mod :treesitter :requires [[:nvim-treesitter/playground]]}
  :hrsh7th/cmp-buffer {}
  :hrsh7th/cmp-cmdline {}
  :hrsh7th/cmp-nvim-lsp {}
  :hrsh7th/cmp-nvim-lsp-signature-help {}
  :hrsh7th/cmp-nvim-lsp-document-symbol {}
  :hrsh7th/cmp-path {}
  :hrsh7th/nvim-cmp {:mod :cmp}
  :jiangmiao/auto-pairs {:mod :auto-pairs}
  :lewis6991/impatient.nvim {}
  :liuchengxu/vim-better-default {:mod :better-default}
  :shaunsingh/nord.nvim {:mod :nord}
  :mbbill/undotree {:mod :undotree}
  :nvim-tree/nvim-tree.lua {:mod :nvim-tree}
  :posva/vim-vue {}
  :neovim/nvim-lspconfig {:mod :lspconfig :requires [["b0o/SchemaStore.nvim"]]}
  :nvim-lualine/lualine.nvim {:mod :lualine}
  :ryanoasis/vim-devicons {}
  :junegunn/vim-emoji {}
  :akinsho/bufferline.nvim {:mod :bufferline :tag "v3.*" :requires [[:nvim-tree/nvim-web-devicons]]}
  :folke/trouble.nvim {:mod :trouble :requires [[:nvim-tree/nvim-web-devicons]]}
  :nvim-telescope/telescope-file-browser.nvim {}
  :otavioschwanck/telescope-alternate.nvim {}
  ;:beauwilliams/focus.nvim {:mod :focus}
  :nvim-telescope/telescope.nvim {:mod :telescope :requires [[:nvim-lua/popup.nvim] [:nvim-lua/plenary.nvim]]}
  ;:vim-test/vim-test {:mod :vim-test}
  :nvim-neotest/neotest {:mod :neotest
                         :requires [[:nvim-lua/plenary.nvim]
                                    [:zidhuss/neotest-minitest]
                                    [:mfussenegger/nvim-dap]
                                    [:suketa/nvim-dap-ruby]
                                    [:nvim-neotest/neotest-jest]
                                    [:rouge8/neotest-rust]
                                    ["~/src/neotest-rspec"]
                                    [:nvim-treesitter/nvim-treesitter]
                                    [:antoinemadec/FixCursorHold.nvim]]}
  :haydenmeade/neotest-jest {}
  :junegunn/vim-easy-align {:mod :vim-easy-align}
  :glepnir/lspsaga.nvim {:mod :lspsaga :branch :main :requires [[:nvim-tree/nvim-web-devicons]]}
  :bhurlow/vim-parinfer {}
  :AndrewRadev/splitjoin.vim {}
  :radenling/vim-dispatch-neovim {}
  :yorickpeterse/nvim-pqf {}
  :tpope/vim-abolish {}
  :tpope/vim-commentary {}
  :tpope/vim-dispatch {}
  :tpope/vim-eunuch {}
  :tpope/vim-fugitive {:mod :fugitive}
  :tpope/vim-repeat {}
  :tpope/vim-sexp-mappings-for-regular-people {}
  :tpope/vim-sleuth {}
  :tpope/vim-surround {}
  :tpope/vim-unimpaired {}
  :tpope/vim-vinegar {}
  :w0rp/ale {:mod :ale}
  :wbthomason/packer.nvim {})
