(module vile-nvim
  {autoload {a aniseed.core
             nvim aniseed.nvim
             plugins dots.plugins}})

(require "dots.keybinds")

(set nvim.o.termguicolors true)
(set nvim.o.tabstop 4)
(set nvim.o.shiftwidth 4)
(set nvim.o.softtabstop 4)
(set nvim.o.expandtab true)
(set nvim.g.mapleader " ")
(set nvim.o.mouse :a)
(set nvim.o.number true)
(set nvim.o.relativenumber true)
(set nvim.g.indent_blankline_use_treesitter true)
(set nvim.g.foldmethod :expr)

(plugins.use
  :Olical/aniseed {}
  :lewis6991/impatient.nvim {}
  :neovim/nvim-lspconfig {:mod :lspconfig}
  :simrat39/rust-tools.nvim {}
  :Saecki/crates.nvim {}
  :akinsho/nvim-bufferline.lua {:mod :bufferline :requires [[:kyazdani42/nvim-web-devicons]]}
  :nvim-telescope/telescope.nvim {:requires [[:nvim-lua/popup.nvim] [:nvim-lua/plenary.nvim]]}
  :nvim-treesitter/nvim-treesitter {:mod :treesitter}
  :hrsh7th/nvim-cmp {:mod :nvim-cmp}
  :norcalli/nvim-base16.lua {:mod :gruvbox}
  :lewis6991/gitsigns.nvim {:mod :gitsigns :requires [[:nvim-lua/plenary.nvim]]}
  :ggandor/lightspeed.nvim {}
  :folke/trouble.nvim {:mod :trouble}
  :lukas-reineke/indent-blankline.nvim {:mod :indent}
  :nvim-telescope/telescope.nvim {}
  :nvim-lualine/lualine.nvim {:mod :lualine}
  :kyazdani42/nvim-web-devicons {:mod :devicons}
  :wbthomason/packer.nvim {})
