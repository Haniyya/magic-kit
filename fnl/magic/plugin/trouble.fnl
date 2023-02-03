(module magic.plugin.trouble)

(let [(ok? trouble) (pcall require :trouble)]
  (when ok?
    (trouble.setup)))
