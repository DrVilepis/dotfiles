(local utils {})

(fn utils.trim_trailing_whitespaces []
  (when (and (not vim.o.binary) (~= vim.o.filetype :diff))
    (let [current_view (vim.fn.winsaveview)]
        (vim.cmd "keepjumps keeppatterns silent! %s/\\s\\+$//e")
        (vim.fn.winrestview current_view))))

(fn utils.get_testaustime_token []
  (let [f (assert (io.input (.. (os.getenv "HOME") "/.config/nvim/testaustime_token")))]
    (let [content (f:read :a)]
      (content:gsub "%s+" ""))))

(fn utils.select_filetype []
  (set vim.bo.filetype ((. (require "telescope.builtin") :filetypes))))

(fn utils.load-fthook [filetype] (pcall require (.. "dots.fthooks." filetype)))

utils
