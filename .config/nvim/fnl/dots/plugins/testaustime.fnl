(local utils (require "dots.utils"))
(local testaustime (require "testaustime"))

(testaustime.setup
  {:token (utils.get_testaustime_token)
   :hostname (if (os.getenv "SSH_CONNECTION") "school_laptop" (vim.fn.hostname))
   :ignored_filetypes [:netrw
                       :TelescopePrompt
                       :help
                       :NeogitStatus
                       :NeogitCommitMessage
                       :NeogitPopup
                       :gitcommit
                       :packer
                       :Cmp_menu
                       :Lazy
                       :Checkhealth]})
