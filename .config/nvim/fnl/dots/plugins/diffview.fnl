(local diffview (require "diffview"))
(local actions (require "diffview.actions"))

(diffview.setup
  {:keymaps
   {:file_panel [["n" "j" actions.next_entry]
                 ["n" "k" actions.prev_entry]]
    :file_history_panel [["n" "j" actions.next_entry]
                         ["n" "k" actions.prev_entry]]}})
