(module dots.keybinds
  {autoload {a aniseed.core
             gs gitsigns
             : plenary
             : bufferline
             : bufdelete
             : trouble
             ts_utils nvim-treesitter.ts_utils
             utils dots.utils
             telescope_builtin telescope.builtin
             telescope_themes telescope.themes}})

(defn map [mode lhs rhs ?opts]
  (vim.keymap.set mode lhs rhs (or ?opts {:noremap true})))

;; (map :t "<Esc>" "<C-\\><C-n>")
(map :n "<leader>dd" "\"_dd")

(for [i 1 9]
  (map :n (.. "<leader>" i) #(bufferline.go_to_buffer i true)))

;; Telescope
(map :n "<leader>ff" telescope_builtin.find_files)
(map :n "<leader>fg" telescope_builtin.live_grep)
(map :n "<leader>fb" telescope_builtin.buffers)
(map :n "<leader>fh" telescope_builtin.help_tags)
(map :n "<leader>fd" telescope_builtin.diagnostics)
(map :n "<leader>fo" telescope_builtin.oldfiles)
(map :n "<leader>fm" telescope_builtin.marks)
(map :n "<leader>fl" utils.select_filetype)

;; Bufferline keybinds
(map :n "bö" "<cmd>BufferLineCycleNext<CR>")
(map :n "bj" "<cmd>BufferLineCyclePrev<CR>")
(map :n "bl" "<cmd>BufferLineMoveNext<CR>")
(map :n "bk" "<cmd>BufferLineMovePrev<CR>")
(map :n "bf" "<cmd>BufferLinePick<CR>")
(map :n "bd" #(bufdelete.bufdelete 0 true) {:noremap true :silent true})

(map :n "<leader>sh" "<cmd>split<CR>")
(map :n "<leader>sv" "<cmd>vsplit<CR>")

;; Lsp keybinds
(map :n "<leader><space>" vim.lsp.buf.hover)
(map :n "<leader>lr" vim.lsp.buf.rename)
(map :n "<leader>ls" (fn [] (vim.lsp.stop_client (vim.lsp.get_active_clients))
                       (vim.notify "Lsp stopped" vim.log.levels.WARN)))

;; Rust related keybinds
(map :n "<leader>rs" "<cmd>RustStartStandaloneServerForBuffer<CR>")
(map :n "<leader>rh" "<cmd>RustHoverRange<CR>")
(map :n "<leader>ra" "<cmd>RustCodeAction<CR>")
(map :n "<leader>ru" "<cmd>RustMoveItemUp<CR>")
(map :n "<leader>rd" "<cmd>RustMoveItemDown<CR>")
(map :n "<leader>re" "<cmd>RustExpandMacro<CR>")
(map :n "<leader>rp" "<cmd>RustParentModule<CR>")

;; Gitsigns
(map [:n :v] "<leader>hs" gs.stage_hunk)
(map [:n :v] "<leader>hr" gs.reset_hunk)
(map :n "<leader>hS" gs.stage_buffer)
(map :n "<leader>hu" gs.undo_stage_hunk)
(map :n "<leader>hR" gs.reset_buffer)
(map :n "<leader>hp" gs.preview_hunk)
(map :n "<leader>hb" #(gs.blame_line {:full true}))
;; (map :n "<leader>tb" gs.toggle_current_line_blame)
(map :n "<leader>hd" gs.diffthis)
(map :n "<leader>hD" #(gs.diffthis "~"))
;; (map :n "<leader>hd" gs.toggle_deleted)

(map :n "<leader>rf" ":RustFmt<CR>")

;; Trouble.nvim keybinds
(map :n "<leader>xx" "<cmd>Trouble<cr>" {:noremap true :silent true})
(map :n "<leader>xw" "<cmd>Trouble lsp_workspace_diagnostics<cr>" {:noremap true :silent true})
(map :n "<leader>xd" "<cmd>Trouble lsp_document_diagnostics<cr>" {:noremap true :silent true})
(map :n "<leader>xl" "<cmd>Trouble loclist<cr>" {:noremap true :silent true})
(map :n "<leader>xq" "<cmd>Trouble quickfix<cr>" {:noremap true :silent true})

(map [:n :v] :h #(vim.cmd "nohlsearch"))

;; Nordic remaps
(map [:n :v] :j :h)
(map [:n :v] :k :j)
(map [:n :v] :l :k)
(map [:n :v] :ö :l)
(map [:n :v] :K vim.diagnostic.goto_next)
(map [:n :v] :L vim.diagnostic.goto_prev)
(map [:n :v] :Ö :L)

(map [:n :v] :<C-W>j :<C-W>h)
(map [:n :v] :<C-W>k :<C-W>j)
(map [:n :v] :<C-W>l :<C-W>k)
(map [:n :v] :<C-W>ö :<C-W>l)
