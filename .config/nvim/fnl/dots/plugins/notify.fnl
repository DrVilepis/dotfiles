(local notify (require "notify"))

(notify.setup {:render :minimal
               :stages :static})

(set vim.notify notify)
