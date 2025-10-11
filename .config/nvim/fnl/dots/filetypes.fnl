(vim.filetype.add
  {:extension
   {:vert :glsl
    :frag :glsl
    :wgsl :wgsl}})

(vim.api.nvim_create_autocmd ["BufEnter"]
                             {:pattern ["*.vue" "*.ts" "*.css" "*.json" "*.esdl"]
                              :callback #(do (set vim.opt_local.shiftwidth 2)
                                             (set vim.opt_local.softtabstop 2))})

(vim.api.nvim_create_autocmd ["BufEnter"]
                             {:pattern ["*.txt" "*.md"]
                              :callback #(do
                                           (set vim.opt_local.linebreak true)
                                           (set vim.opt_local.textwidth 80))})
