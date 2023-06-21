(module dots.plugins.devicons
  {autoload {a aniseed.core
             devicons nvim-web-devicons}})

(devicons.setup
  {:override
   {:zsh
    {:icon :
     :color :#428850
     :name :Zsh}}
   :default true})
