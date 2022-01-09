function kb(s,k,a,o)
    o = o or {noremap = true}
    vim.api.nvim_set_keymap(s,k,a,o)
end

--vim.cmd([[
--    map <up> <nop>
--    map <down> <nop>
--    map <left> <nop>
--    map <right> <nop>
--    imap <up> <nop>
--    imap <down> <nop>
--    imap <left> <nop>
--    imap <right> <nop>
--]])

-- Finnish moment
kb('','j','h')
kb('','k','j')
kb('','ö','l')
kb('','l','k')

kb('','J','H')
kb('','K','J')
kb('','Ö','L')
kb('','L','K')

kb('','<A-k>','<cmd>m .+1<CR>==', { noremap = true })
kb('','<A-l>','<cmd>m .-2<CR>==', { noremap = true })

-- Telescope keybinds
kb('','<leader>ff','<cmd>Telescope find_files<CR>')
kb('','<leader>fg','<cmd>Telescope live_grep<CR>')
kb('','<leader>fb','<cmd>Telescope buffers<CR>')
kb('','<leader>fh','<cmd>Telescope help_tags<CR>')

-- NvimTree keybinds
kb('','<C-n>','<cmd>NvimTreeToggle<CR>')
kb('','<leader>nr','<cmd>NvimTreeRefresh<CR>')
kb('','<leader>nn','<cmd>NvimTreeFindFile<CR>')
kb('t','<Esc>','<C-\\><C-n>')

-- Bufferline keybinds
kb('','bl','<cmd>BufferLineCycleNext<CR>')
kb('','bk','<cmd>BufferLineCyclePrev<CR>')
kb('','bf','<cmd>BufferLinePick<CR>')
kb('','bö','<cmd>BufferLineMoveNext<CR>')
kb('','bj','<cmd>BufferLineMovePrev<CR>')
kb('','be','<cmd>BufferLineSortByExtension<CR>',{ noremap = true, silent = true })
kb('','bd','<cmd>BufferLineSortByDirectory<CR>',{ noremap = true, silent = true })

-- Lsp keybinds
kb('','<leader><space>','<cmd>lua vim.lsp.buf.hover()<CR>')
kb('','<leader>rn','<cmd>lua vim.lsp.buf.rename()<CR>')

-- Rust related keybinds
kb('','<leader>rh','<cmd>RustHoverRange<CR>')
kb('','<leader>ra','<cmd>RustCodeAction<CR>')
kb('','<leader>ru','<cmd>RustMoveItemUp<CR>')
kb('','<leader>rd','<cmd>RustMoveItemDown<CR>')
kb('','<leader>re','<cmd>RustExpandMacro<CR>')
kb('','<leader>rr','<cmd>RustRunnables<CR>')
kb('','<leader>rp','<cmd>RustParentModule<CR>')

-- Trouble.nvim keybinds
kb("n", "<leader>xx", "<cmd>Trouble<cr>",{silent = true, noremap = true})
kb("n", "<leader>xw", "<cmd>Trouble lsp_workspace_diagnostics<cr>",{silent = true, noremap = true})
kb("n", "<leader>xd", "<cmd>Trouble lsp_document_diagnostics<cr>",{silent = true, noremap = true})
kb("n", "<leader>xl", "<cmd>Trouble loclist<cr>",{silent = true, noremap = true})
kb("n", "<leader>xq", "<cmd>Trouble quickfix<cr>",{silent = true, noremap = true})
kb("n", "gR", "<cmd>Trouble lsp_references<cr>",{silent = true, noremap = true})
