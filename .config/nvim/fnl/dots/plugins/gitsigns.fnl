(module dots.plugins.gitsigns
  {autoload {a aniseed.core
             gitsigns gitsigns}})

(gitsigns.setup
  {:signs {:add          {:text "|"}
           :change       {:text "|"}
           :delete       {:text "_"}
           :topdelete    {:text "^"}
           :changedelete {:text "~"}
           :untracked    {:text "┆"}}
   :keymaps {:noremap true
             :buffer true}
   :current_line_blame false
   :update_debounce 100})
