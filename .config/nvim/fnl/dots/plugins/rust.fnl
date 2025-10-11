(set vim.g.rustaceanvim {:server
                         {:default_settings
                          {:rust-analyzer
                           {:diagnostics
                            {:disabled
                             ["unlinked-file"]}}}}})
