(module magic.plugin.neotest
  {autoload {nvim aniseed.nvim
             util magic.util}})

(defn- map [from to]
  (vim.keymap.set :n from to))

(defn- lmap [from to]
  (vim.keymap.set :n (.. :<localleader> from) to)
  (vim.keymap.set :n (.. :<leader> from) to))

(let [(ok? neotest) (pcall #(require :neotest))
      (rspec-ok? neotest-rspec) (pcall #(require :neotest-rspec))
      (dap-ok? nvim-dap) (pcall #(require :dap))
      (dap-ruby-ok? nvim-dap-ruby) (pcall #(require :dap-ruby))
      dap-ui (require :dap.ui.widgets)]
  (when (and dap-ok? dap-ruby-ok?)
    (nvim-dap-ruby.setup)
    (map "<F5>" nvim-dap.continue)
    (map "<F10>" nvim-dap.step_over)
    (map "<F11>" nvim-dap.step_into)
    (map "<F12>" nvim-dap.step_out)
    (lmap :b nvim-dap.toggle_breakpoint)
    (lmap :dl nvim-dap.run_last))
  (when (and ok? rspec-ok? dap-ok?)
    (neotest.setup {:adapters [(neotest-rspec {})]})
    (lmap :t #(neotest.run.run))
    (lmap :l #(neotest.run.run_last))
    (lmap :r #(neotest.output.open {:enter true}))
    (lmap :f #(neotest.run.run (vim.fn.expand :%)))))
