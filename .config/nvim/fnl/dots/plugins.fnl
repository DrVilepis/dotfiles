(local utils (require "dots.utils"))
(local lazy (require "lazy"))

(local plugins {})

(fn safe-require-plugin-config [name]
  (let [(ok? val-or-err) (pcall require (.. "dots.plugins." name))]
    (when (not ok?)
      (print (.. "Plugin config error: " val-or-err)))))

(fn plugins.use [pkgs]
  (lazy.setup (icollect [name opts (pairs pkgs)]
                        (let [plugin [name]]
                          (-?> (. opts :mod) ((fn [init]
                                                (tset plugin :init #(safe-require-plugin-config init))
                                                (tset opts :mod nil))))
                          (each [opt value (pairs opts)] (tset plugin opt value))
                          plugin))
              {:performance {:reset_packpath false}}))

plugins
