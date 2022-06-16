(module dots.plugins.cmp
  {autoload {a aniseed.core
             cmp cmp
             luasnip luasnip}})

(cmp.setup
  {:snippet {:expand (fn [args] (luasnip.lsp_expand args.body))}
   :sources [{:name :luasnip}
             {:name :nvim_lsp}
             {:name :crates}]
   :mapping {:<C-Space> (cmp.mapping.complete)
             :<CR>      (cmp.mapping.confirm {:select true})
             :<S-Tab>     (fn [] (cmp.select_next_item))
             :<C-Tab>   (fn [] (cmp.select_prev_item))}})

(cmp.setup.cmdline "/" {:sources [{:name :buffer}]})
