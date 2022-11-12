(module dots.keybinds
  {autoload {a aniseed.core
             gs gitsigns
             plenary plenary
             ntapi nvim-tree.api}})

(defn map [mode lhs rhs ?opts]
  (vim.keymap.set mode lhs rhs (or ?opts {:noremap true})))

(map :n "<leader>ff" "<cmd>Telescope find_files<CR>")
(map :n "<leader>fg" "<cmd>Telescope live_grep<CR>")
(map :n "<leader>fb" "<cmd>Telescope buffers<CR>")
(map :n "<leader>fh" "<cmd>Telescope help_tags<CR>")
(map :n "<leader>fe" "<cmd>Telescope env<CR>")
(map :n "<leader>fd" "<cmd>Telescope diagnostics<CR>")
(map :n "<leader>fo" "<cmd>Telescope oldfiles<CR>")
(map :t "<Esc>" "<C-\\><C-n>")

;; Bufferline keybinds
(map :n "bl" "<cmd>BufferLineCycleNext<CR>")
(map :n "bk" "<cmd>BufferLineCyclePrev<CR>")
(map :n "bf" "<cmd>BufferLinePick<CR>")
(map :n "bö" "<cmd>BufferLineMoveNext<CR>")
(map :n "bj" "<cmd>BufferLineMovePrev<CR>")
(map :n "be" "<cmd>BufferLineSortByExtension<CR>" {:noremap true :silent true})
(map :n "bd" "<cmd>BufferLineSortByDirectory<CR>" {:noremap true :silent true})

;; Lsp keybinds
(map :n "<leader><space>" "<cmd>lua vim.lsp.buf.hover()<CR>")
(map :n "<leader>rn" "<cmd>lua vim.lsp.buf.rename()<CR>")
(map :n "<leader>ls" (fn [] (vim.lsp.stop_client (vim.lsp.get_active_clients))
                       (vim.notify "Lsp stopped" vim.log.levels.WARN)))

;; Rust related keybinds
(map :n "<leader>rs" "<cmd>RustStartStandaloneServerForBuffer<CR>")
(map :n "<leader>rh" "<cmd>RustHoverRange<CR>")
(map :n "<leader>ra" "<cmd>RustCodeAction<CR>")
(map :n "<leader>ru" "<cmd>RustMoveItemUp<CR>")
(map :n "<leader>rd" "<cmd>RustMoveItemDown<CR>")
(map :n "<leader>re" "<cmd>RustExpandMacro<CR>")
;; (map :n "<leader>rr" "<cmd>RustRunnables<CR>")
(map :n "<leader>rp" "<cmd>RustParentModule<CR>")

;; Gitsigns
(map [:n :v] "<leader>hs" gs.stage_hunk)
(map [:n :v] "<leader>hr" gs.reset_hunk)
(map :n "<leader>hS" gs.stage_buffer)
(map :n "<leader>hu" gs.undo_stage_hunk)
(map :n "<leader>hR" gs.reset_buffer)
(map :n "<leader>hp" gs.preview_hunk)
(map :n "<leader>hb" (fn [] (gs.blame_line {:full true})))
;; (map :n "<leader>tb" gs.toggle_current_line_blame)
(map :n "<leader>hd" gs.diffthis)
(map :n "<leader>hD" (fn [] (gs.diffthis "~")))
;; (map :n "<leader>hd" gs.toggle_deleted)

(map :n "<leader>tt" (fn [] (ntapi.tree.focus)))
(map :n "<leader>tq" (fn [] (ntapi.tree.close)))

(map :n "<leader>n" ":Neogit<CR>")

(map :n "<leader>rf" ":RustFmt<CR>")

;; Trouble.nvim keybinds
(map :n "<leader>xx" "<cmd>Trouble<cr>" {:noremap true :silent true})
(map :n "<leader>xw" "<cmd>Trouble lsp_workspace_diagnostics<cr>" {:noremap true :silent true})
(map :n "<leader>xd" "<cmd>Trouble lsp_document_diagnostics<cr>" {:noremap true :silent true})
(map :n "<leader>xl" "<cmd>Trouble loclist<cr>" {:noremap true :silent true})
(map :n "<leader>xq" "<cmd>Trouble quickfix<cr>" {:noremap true :silent true})
(map :n "gR" "<cmd>Trouble lsp_references<cr>" {:noremap true :silent true})

(map [:n :v] :h "/")
(map [:n :v] :H (fn [] (vim.cmd "nohlsearch")))

(map [:n :v] :j :h)
(map [:n :v] :k :j)
(map [:n :v] :ö :l)
(map [:n :v] :l :k)
(map [:n :v] :J :H)
(map [:n :v] :K :J)
(map [:n :v] :Ö :L)
(map [:n :v] :L :K)
