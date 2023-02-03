(module magic.plugin.bufferline)

(let [(ok? bufferline) (pcall require :bufferline)
      (nord_ok? nord) (pcall require :nord)]
  (when (and ok? nord_ok?)
    (let [highlights (nord.bufferline.highlights {:italic true :bold true})]
      (bufferline.setup
        {:highlights highlights
         :options
         {:separator_style :thin}}))))
