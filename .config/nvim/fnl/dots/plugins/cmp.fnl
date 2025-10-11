(local cmp (require "cmp"))
(local luasnip (require "luasnip"))
(local compare (require "cmp.config.compare"))

(cmp.setup
  {:snippet {:expand (fn [args] (luasnip.lsp_expand args.body))}
   :sources [{:name :luasnip}
             {:name :nvim_lsp}
             {:name :crates}
             {:name :nvim_lsp_signature_help}
             {:name :path}]
   :mapping {:<C-Space> (cmp.mapping.complete)
             :<Tab>     (cmp.mapping.confirm {:select true})
             :<A-k>   #(if (cmp.visible) (cmp.select_next_item) ($))
             :<A-l>   #(if (cmp.visible) (cmp.select_prev_item) ($))}})

(cmp.setup.cmdline "/" {:sources [{:name :buffer}]})
(cmp.setup.cmdline ":" {:sources [{:name :path}]})

