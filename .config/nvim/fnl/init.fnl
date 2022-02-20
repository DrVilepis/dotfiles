(module vile-nvim
  {autoload {a aniseed.core
             nvim aniseed.nvim
             plugins dots.plugins}})

(set nvim.o.termguicolors true)
(set nvim.o.tabstop 4)
(set nvim.o.shiftwidth 4)
(set nvim.o.softtabstop 4)
(set nvim.o.expandtab true)
(set nvim.g.mapleader " ")
(set nvim.g.maplocalleader " ")
(set nvim.o.mouse :a)
(set nvim.o.number true)
(set nvim.o.relativenumber true)
(set nvim.g.indent_blankline_use_treesitter true)
(set nvim.g.foldmethod :expr)
(set nvim.g.rustfmt_autosave 1)

(require "dots.keybinds")

(plugins.use
  :Olical/aniseed {}
  :lewis6991/impatient.nvim {}
  :neovim/nvim-lspconfig {:mod :lspconfig}
  :L3MON4D3/LuaSnip {}
  :Saecki/crates.nvim {}
  :mfussenegger/nvim-dap {:opt false}
  :nvim-telescope/telescope-dap.nvim {:requires [:mfussenegger/nvim-dap
                                                 :nvim-telescope/telescope.nvim]}

  :akinsho/nvim-bufferline.lua {:mod :bufferline :requires [[:kyazdani42/nvim-web-devicons]]}
  :nvim-telescope/telescope.nvim {:requires [[:nvim-lua/popup.nvim] [:nvim-lua/plenary.nvim]]}
  :nvim-treesitter/nvim-treesitter {:mod :treesitter}

  :rust-lang/rust.vim {:ft ["rust"]}
  :simrat39/rust-tools.nvim {:mod :rust-tools}
  :neovimhaskell/haskell-vim {:ft ["haskell"]}
  :bakpakin/fennel.vim {:ft ["fennel"]}

  :norcalli/nvim-base16.lua {:mod :gruvbox}
  :lewis6991/gitsigns.nvim {:mod :gitsigns :requires [[:nvim-lua/plenary.nvim]]}
  :ggandor/lightspeed.nvim {}
  :folke/trouble.nvim {:mod :trouble}
  :lukas-reineke/indent-blankline.nvim {:mod :indent}
  :nvim-lualine/lualine.nvim {:mod :lualine}
  :kyazdani42/nvim-web-devicons {:mod :devicons}
  :jiangmiao/auto-pairs {}
  :tpope/vim-surround {}
  :wellle/targets.vim {}
  ;; nvim-cmp for completion
  :hrsh7th/cmp-nvim-lsp {}
  :hrsh7th/cmp-path {}
  :hrsh7th/nvim-cmp {:opt false
                     :requires [:hrsh7th/cmp-nvim-lsp
                                :hrsh7th/cmp-path]
                     :mod :cmp}

  :wbthomason/packer.nvim {})
