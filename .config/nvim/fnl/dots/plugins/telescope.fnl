(local telescope (require "telescope"))
(local themes (require "telescope.themes"))
(local actions (require "telescope.actions"))

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

;; (telescope.load_extension "fzf")
