(module dots.plugins.treesitter
  {autoload {a aniseed.core
             treesitter nvim-treesitter}})

(treesitter.setup
  {:highlight
   {:enable true}
   :indent
   {:enable true}})
