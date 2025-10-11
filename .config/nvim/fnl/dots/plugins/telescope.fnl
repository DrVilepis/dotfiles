(local telescope (require "telescope"))
(local themes (require "telescope.themes"))
(local actions (require "telescope.actions"))

(telescope.setup
  {:defaults
   {:borderchars {:prompt  [ "─" "│" "─" "│" "┌" "┐" "┘" "└" ]
                  :results [ "─" "│" "─" "│" "┌" "┐" "┘" "└" ]
                  :preview [ "─" "│" "─" "│" "┌" "┐" "┘" "└" ]}
    :file_ignore_patterns ["^node_modules/"]
    :mappings {:i {:<A-k> actions.move_selection_next
                   :<A-l> actions.move_selection_previous}
               :n {:k actions.move_selection_next
                   :l actions.move_selection_previous}}}
   :pickers
   {:find_file
    {:theme :dropdown}}
   :extensions
   {:fzf {:fuzzy true}}})

(telescope.load_extension "fzf")
(telescope.load_extension "find_template")
