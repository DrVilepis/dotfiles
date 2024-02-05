(local colors (require "dots.colors.tomorrow"))
(local indent_blankline (require "ibl"))

(indent_blankline.setup
  {:indent {:char "|"}
   :scope {:show_start false}})
