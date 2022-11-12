(module dots.plugins.notify
  {autoload {a aniseed.core
             notify notify}})

(notify.setup {:render :minimal
               :stages :static})

(set vim.notify notify)
