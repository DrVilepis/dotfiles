(module dots.plugins.autopairs
  {autoload {ap nvim-autopairs}})

(ap.setup {:disable_filetype [:TelescopePrompt]})
