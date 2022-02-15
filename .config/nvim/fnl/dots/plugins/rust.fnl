(module dots.plugins.rust
  {autoload {a aniseed.core
             rust-tools rust-tools}})

(rust-tools.setup
  {:tools
   {:hover_with_actions true
    :hover_actions
    {:auto_focus true}}})
