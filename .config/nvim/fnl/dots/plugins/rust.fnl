(module dots.plugins.rust-tools
  {autoload {a aniseed.core
             rust-tools rust-tools}})

(rust-tools.setup
  {:tools
   {:autoSetHints true
    :hover_with_actions true
    :hover_actions {:auto_focus true}
    :inlay_hints {:only_current_line false}
    :server {:standalone true}}})
