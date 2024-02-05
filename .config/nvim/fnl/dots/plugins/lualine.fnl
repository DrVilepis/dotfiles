(local utils (require "dots.utils"))
(local lualine (require "lualine"))
(local colors (require "dots.colors.tomorrow"))

(lualine.setup
  {:options
   {:icons_enabled true
    :component_separators {:left "┃" :right "┃"}
    :section_separators {:left "" :right ""}
    :theme {:normal
            {:a {:bg colors.light0 :fg colors.dark0 :gui :bold}
             :b {:bg colors.dark2 :fg colors.light0}
             :c {:bg colors.dark1 :fg colors.light0}}
            :insert
            {:a {:bg colors.green :fg colors.dark0 :gui :bold}
             :b {:bg colors.dark2 :fg colors.green}
             :c {:bg colors.dark1 :fg colors.green}}
            :visual
            {:a {:bg colors.blue :fg colors.dark0 :gui :bold}
             :b {:bg colors.dark2 :fg colors.blue}
             :c {:bg colors.dark1 :fg colors.blue}}
            :replace
            {:a {:bg colors.red :fg colors.dark0 :gui :bold}
             :b {:bg colors.dark2 :fg colors.red}
             :c {:bg colors.dark1 :fg colors.red}}
            :command
            {:a {:bg colors.magenta :fg colors.dark0 :gui :bold}
             :b {:bg colors.dark2 :fg colors.magenta}
             :c {:bg colors.dark1 :fg colors.magenta}}
            :inactive
            {:a {:bg colors.dark1 :fg colors.light0 :gui :bold}
             :b {:bg colors.dark1 :fg colors.light0}
             :c {:bg colors.dark1 :fg colors.light0}}}}
   :sections {:lualine_a [:mode]
              :lualine_b [:hostname
                          (fn [] (let [lsp (vim.lsp.get_active_clients)]
                                   (.. " lsp: "
                                       (if (next lsp)
                                         (table.concat (icollect [_ val (pairs lsp)] (. val :name)) " & ")
                                         "None"))))]
              :lualine_c [:filename :branch :diff]
              :lualine_x [:encoding :fileformat]
              :lualine_y [#(if (or (= vim.bo.filetype "text") (= vim.bo.filetype "markdown")) (.. "Chars: " (. (vim.fn.wordcount) :chars)) "")
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
                       :lualine_z []}})
