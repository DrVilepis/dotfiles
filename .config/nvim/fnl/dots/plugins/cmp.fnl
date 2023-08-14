(module dots.plugins.cmp
  {autoload {a aniseed.core
             cmp cmp
             luasnip luasnip
             compare cmp.config.compare}})
(cmp.setup
  {:snippet {:expand (fn [args] (luasnip.lsp_expand args.body))}
   :sources [{:name :luasnip}
             {:name :nvim_lsp}
             {:name :crates}
             {:name :path}]
   :mapping {:<C-Space> (cmp.mapping.complete)
             :<Tab>     (cmp.mapping.confirm {:select true})
             :<S-Tab>   #(if (cmp.visible) (cmp.select_next_item) ($))}})

(cmp.setup.cmdline "/" {:sources [{:name :buffer}]})

(cmp.setup.cmdline ":" {:sources [{:name :path}]})
