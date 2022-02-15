(module dots.plugins.lspconfig
  {autoload {a aniseed.core
             lsp lspconfig}})

(lsp.clangd.setup {})

(lsp.elixirls.setup 
  {:cmd ["~/elixir/language_server.sh"]})
