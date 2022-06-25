(module dots.plugins.indent
  {autoload {a aniseed.core
             {:colors colors} dots.colors
             indent_blankline indent_blankline}})

(vim.cmd "highlight indent1 guifg=#E06C75 gui=nocombine")
(vim.cmd "highlight indent2 guifg=#ffffff gui=nocombine")
(vim.cmd (.. "highlight IndentBlanklineContextChar guifg=#" colors.green " gui=nocombine"))

(indent_blankline.setup
  {:char "|"
   :buftype_exclude [:terminal]
   :show_current_context true})
