(local lsp (require "lspconfig"))
(local cmp_lsp (require "cmp_nvim_lsp"))

(local default-capabilities
  (let [capabilities (vim.lsp.protocol.make_client_capabilities)]
    (set capabilities.textDocument.completion.completionItem.snippetSupport true)
    (cmp_lsp.default_capabilities capabilities)))

(fn init-lsp [lsp-name ?opts]
  (let [merged-opts {:capabilities default-capabilities}]
    ((. lsp lsp-name :setup) merged-opts)))

(init-lsp :clangd)
;; (init-lsp :elixirls {:cmd ["~/elixir/language_server.sh"]})
;; (init-lsp :hls {:single_file_support true})
(init-lsp :asm_lsp)
(init-lsp :tsserver)
(init-lsp :elmls)
(init-lsp :clojure_lsp)
(init-lsp :lua_ls)
(init-lsp :wgsl_analyzer)
(init-lsp :vuels)
;;(init-lsp :rust_analyzer)
;; (init-lsp :pyright)
 (let [rust-tools (require "rust-tools")]
  (rust-tools.setup {:tools {:inlay_hints {:show_parameter_hints false}
                             :on_initialized (fn [] (vim.notify "rust_analyzer initialized"))
                             :autoSetHints false}
                     :server {:capabilities default-capabilities
                              :standalone true}}))
