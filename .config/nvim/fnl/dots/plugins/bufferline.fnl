(module dots.plugins.bufferline
  {autoload {a aniseed.core
             nvim aniseed.nvim
             bufferline bufferline
             {: colors} dots.colors}})

(bufferline.setup
  {:options
   {:themable true
    :diagnostics :nvim_lsp
    :show_close_icon false
    :show_buffer_clone_icons false
    :separator_style :thin
    :buffer_close_icon ""
    :modified_icon "●"
    :close_icon ""}
   :highlights
   {:fill {:bg colors.dark0}
    :background {:bg colors.dark1}
    :close_button {:bg colors.dark1}
    :close_button_selected {:bg colors.dark2}
    :close_button_visible {:bg colors.dark1}
    :indicator_selected {:fg colors.dark2 :bg colors.dark2}
    :indicator_visible {:fg colors.dark1 :bg colors.dark1}
    :modified {:bg colors.dark1}
    :modified_selected {:bg colors.dark2}
    :modified_visible {:bg colors.dark1}
    :warning {:bg colors.dark1}
    :warning_selected {:bg colors.dark2}
    :warning_visible {:bg colors.dark1}
    :error {:bg colors.dark1}
    :error_selected {:bg colors.dark2}
    :error_visible {:bg colors.dark1}
    :hint {:bg colors.dark1}
    :hint_selected {:bg colors.dark2}
    :hint_visible {:bg colors.dark1}
    :info {:bg colors.dark1}
    :info_selected {:bg colors.dark2}
    :info_visible {:bg colors.dark1}
    :separator {:fg colors.dark0}
    :duplicate {:bg colors.dark1}
    :duplicate_selected {:bg colors.dark2}
    :duplicate_visible {:bg colors.dark2}
    :buffer_selected {:bg colors.dark2}
    :buffer_visible {:bg colors.dark1}}})
