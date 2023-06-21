(module dots.plugins.lualine
  {autoload {a aniseed.core
             nvim aniseed.nvim
             utils dots.utils
             lualine lualine}
   require {colors dots.colors}})

(let [colors (collect [k v (pairs (. colors :colors))] k (.. "#" v))]
  (lualine.setup
    {:options
     {:icons_enabled true
      :component_separators {:left "┃" :right "┃"}
      :section_separators {:left "" :right ""}
      :theme {:normal
              {:a {:bg colors.light2 :fg colors.dark0 :gui :bold}
               :b {:bg colors.dark1 :fg colors.light3}
               :c {:bg colors.dark2 :fg colors.light3}}
              :insert
              {:a {:bg colors.green :fg colors.dark0 :gui :bold}
               :b {:bg colors.dark1 :fg colors.green}
               :c {:bg colors.dark2 :fg colors.green}}
              :visual
              {:a {:bg colors.blue :fg colors.dark0 :gui :bold}
               :b {:bg colors.dark1 :fg colors.blue}
               :c {:bg colors.dark1 :fg colors.blue}}
              :replace
              {:a {:bg colors.red :fg colors.dark0 :gui :bold}
               :b {:bg colors.dark1 :fg colors.red}
               :c {:bg colors.dark1 :fg colors.red}}
              :command
              {:a {:bg colors.purple :fg colors.dark0 :gui :bold}
               :b {:bg colors.dark1 :fg colors.purple}
               :c {:bg colors.dark1 :fg colors.purple}}
              :inactive
              {:a {:bg colors.dark1 :fg colors.light3 :gui :bold}
               :b {:bg colors.dark1 :fg colors.light3}
               :c {:bg colors.dark1 :fg colors.light3}}}}
     :sections {:lualine_a [:mode]
                :lualine_b [:hostname
                            (fn [] (let [lsp (vim.lsp.get_active_clients)]
                                     (.. " lsp: "
                                         (if (next lsp)
                                           (table.concat (icollect [_ val (pairs lsp)] (. val :name)) " & ")
                                           "None"))))]
                :lualine_c [:filename :branch :diff]
                :lualine_x [:encoding :fileformat]
                :lualine_y [#(if (= vim.bo.filetype "text") (.. "Chars: " (. (vim.fn.wordcount) :bytes)) "")
                            {0         :filetype
                             :on_click utils.select_filetype}]
                :lualine_z [(fn [] (let [[cur_line cur_char] (vim.api.nvim_win_get_cursor 0)]
                                     (.. cur_line
                                         ":"
                                         (+ cur_char 1)
                                         "/"
                                         (. (vim.api.nvim_buf_line_count 0))
                                         ":"
                                         (string.len (. (vim.api.nvim_buf_get_lines 0 (- cur_line 1) cur_line false) 1)))))]}
     :inactive_sections {:lualine_a [:filename :filetype]
                         :lualine_b []
                         :lualine_c []
                         :lualine_x []
                         :lualine_y []
                         :lualine_z []}}))
