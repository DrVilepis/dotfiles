(module dots.plugins.telescope
  {autoload {a aniseed.core
             nvim aniseed.nvim
             telescope telescope
             actions telescope.actions}})

(telescope.setup
  {:defaults
   {:borderchars {:prompt  [ "─" "│" "─" "│" "┌" "┐" "┘" "└" ]
                  :results [ "─" "│" "─" "│" "┌" "┐" "┘" "└" ]
                  :preview [ "─" "│" "─" "│" "┌" "┐" "┘" "└" ]}
    :pickers
    {:find_file
     {:theme :dropdown}}
    :mappings
    {:i {:<C-k> actions.move_selection_next
         :<C-l> actions.move_selection_previous}}
    :extensions
    {:fzf {:fuzzy true}}}})

(telescope.load_extension "fzf")
