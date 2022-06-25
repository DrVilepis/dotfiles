(module dots.utils
  {autoload {a aniseed.core
             nvim aniseed.nvim
             packer packer}})

(defn trim_trailing_whitespaces []
  (when (and (not nvim.o.binary) (~= nvim.o.filetype :diff))
    (let [current_view (nvim.fn.winsaveview)]
        (vim.cmd "keeppatterns %s/\\s\\+$//e")
        (nvim.fn.winrestview current_view))))
