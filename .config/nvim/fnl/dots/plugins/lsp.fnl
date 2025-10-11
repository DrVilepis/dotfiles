(local lsp (require "lspconfig"))
(local cmp_lsp (require "cmp_nvim_lsp"))
(require-macros :hibiscus.core)

(local default-capabilities
  (let [capabilities (merge! (cmp_lsp.default_capabilities) (vim.lsp.protocol.make_client_capabilities))]
    (set capabilities.textDocument.completion.completionItem.snippetSupport true)
    (cmp_lsp.default_capabilities capabilities)))

(fn init-lsp [lsp-name ?opts]
  (let [merged-opts (merge! (or ?opts []) {:capabilities default-capabilities})]
    ((. lsp lsp-name :setup) merged-opts)))

(fn handle-attach [args]
  (let [client (vim.lsp.get_client_by_id args.data.client_id)
        buffer (. vim.bo args.buf)]
    (set buffer.formatexpr "v:lua.vim.lsp.formatexpr()")))

(vim.api.nvim_create_autocmd ["LspAttach"] {:callback handle-attach})

(init-lsp :clangd)
(init-lsp :fennel_ls {:filetypes ["fennel"]
                      :root_dir (lsp.util.root_pattern "*")
                      :settings {:fennel-ls {:extra-globals "vim"}}})
;; (init-lsp :asm_lsp)
;; (init-lsp :elmls)
;; (init-lsp :clojure_lsp)
;; (init-lsp :lua_ls)
;; (init-lsp :cssls)
(vim.lsp.enable :asm_lsp)
(vim.lsp.enable :elmls)
(vim.lsp.enable :clojure_lsp)
(vim.lsp.enable :lua_ls)
(vim.lsp.enable :cssls)
(vim.lsp.enable :glasgow)
(init-lsp :ts_ls {:init_options
                  {:plugins
                   [{:name "@vue/typescript-plugin"
                     :location "/home/drvilepis/.bun/install/global/node_modules/@vue/typescript-plugin"
                     :languages ["javascript" "typescript" "vue"]}]}
                  :filetypes ["javascript"
                              "javascriptreact"
                              "typescript"
                              "typescriptreact"
                              "vue"]})

(init-lsp :volar)
