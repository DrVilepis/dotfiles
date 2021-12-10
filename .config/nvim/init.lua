-- Load plugins
require('plugins')

vim.o.termguicolors = true

-- Lualine for statusline
require('vile-lualine')

-- Everforest colorscheme
local base16 = require 'base16'
base16(base16.themes["gruvbox-dark-hard"])

-- Coq autocompletion
vim.g.coq_settings = { auto_start = 'shut-up' }
require('coq')

require'lspconfig'.hls.setup {}

-- Rust-analyzer options
-- require'lspconfig'.rust_analyzer.setup{}

-- require('crates').setup {}
require('crates').setup()
rust = require('rust-tools')
rust.setup({
    tools = {
        hover_with_actions = true,
        hover_actions = {
            auto_focus = true
        }
    }
})

require('trouble').setup {
    action_keys = {
        previous = 'l',
        next = 'k',
    }
}

-- Telescope for fuzzyfinder
require('telescope').setup{}

-- Devicons for icons in nvimtree and bufferline
require'nvim-web-devicons'.setup {
    override = {
        zsh = {
            icon = "",
            color = "#428850",
            name = "Zsh"
        }
    };
    default = true;
}

require('gitsigns').setup{}

-- Treesitter for syntax highlighting
vim.g.indent_blankline_use_treesitter = true
require'nvim-treesitter.configs'.setup {
    highlight = {
        enable = true,
    },
}

vim.cmd [[highlight indent1 guifg=#E06C75 gui=nocombine]]
vim.cmd [[highlight indent2 guifg=#ffffff gui=nocombine]]

-- Indentation guides
require("indent_blankline").setup {
    char = "|",
    buftype_exclude = {"terminal"},
}

-- Nvim-tree setup
require'nvim-tree'.setup {
    update_focused_file = {
        enable = true,
    }
}

require('lightspeed').setup {}

-- Bufferline for buffer tabs
require('bufferline').setup {
    options = {
        diagnostics = "nvim_lsp",
        show_close_icon = false,
        show_buffer_close_icons = false,
        offsets = {{filetype = "NvimTree", text = "File Explorer", text_align = "left"}},
        custom_areas = {
            right = function()
                local result = {}
                local error = vim.lsp.diagnostic.get_count(0, [[Error]])
                local warning = vim.lsp.diagnostic.get_count(0, [[Warning]])
                local info = vim.lsp.diagnostic.get_count(0, [[Information]])
                local hint = vim.lsp.diagnostic.get_count(0, [[Hint]])

                if error ~= 0 then
                    table.insert(result, {text = "  " .. error, guifg = "#EC5241"})
                end

                if warning ~= 0 then
                    table.insert(result, {text = "  " .. warning, guifg = "#EFB839"})
                end

                if hint ~= 0 then
                    table.insert(result, {text = "  " .. hint, guifg = "#A3BA5E"})
                end

                if info ~= 0 then
                    table.insert(result, {text = "  " .. info, guifg = "#7EA9A7"})
                end
                return result
            end,
        }
    },
}

-- General 
require('core.settings')
require('core.keybinds')
