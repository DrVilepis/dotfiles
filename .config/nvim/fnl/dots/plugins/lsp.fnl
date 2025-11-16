(local cmp_lsp (require "cmp_nvim_lsp"))

(vim.lsp.config "*" {:capabilities
                     {:textDocument
                      {:completion
                       {:completionItem
                        {:snippetSupport true}}}}})

(fn handle-attach [args]
  (let [client (vim.lsp.get_client_by_id args.data.client_id)
        buffer (. vim.bo args.buf)]
    (set buffer.formatexpr "v:lua.vim.lsp.formatexpr()")))

(vim.api.nvim_create_autocmd ["LspAttach"] {:callback handle-attach})

(vim.lsp.enable :clangd)
(vim.lsp.enable :fennel_ls)
(vim.lsp.config :fennel_ls {:filetypes ["fennel"]
                            :root_dir "*"
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
(vim.lsp.enable :ts_ls)
(vim.lsp.config :ts_ls {:init_options
                  {:plugins
                   [{:name "@vue/typescript-plugin"
                     :location "/home/drvilepis/.bun/install/global/node_modules/@vue/typescript-plugin"
                     :languages ["javascript" "typescript" "vue"]}]}
                  :filetypes ["javascript"
                              "javascriptreact"
                              "typescript"
                              "typescriptreact"
                              "vue"]})
