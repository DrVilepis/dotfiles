(local treesitter (require "nvim-treesitter.configs"))

(treesitter.setup
  {:ensure_installed [:rust]
   :highlight {:enable true}
   :indent {:enable true
            :disable [:rust]}})
