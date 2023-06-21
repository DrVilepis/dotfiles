(module vile-nvim
  {autoload {a aniseed.core
             nvim aniseed.nvim
             plugins dots.plugins
             utils dots.utils
             {: colors} dots.colors}})

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
(set nvim.o.cmdheight 1)
(set nvim.o.scrolloff 3)
(set vim.o.cursorline true)
;; (set vim.o.colorcolumn "+1")

(require :dots.keybinds)
(require :dots.filetypes)

(vim.api.nvim_create_autocmd ["BufWritePre"] {:callback utils.trim_trailing_whitespaces})

(require :dots.theme)

(plugins.use
  ;; Starting speed
  :lewis6991/impatient.nvim {}

  ;; Fennel config support
  :Olical/aniseed {}

  ;; Lsp
  :neovim/nvim-lspconfig {:mod :lsp}

  ;; Important
  :rcarriga/nvim-notify {:mod :notify}

  ;; Snippets
  :L3MON4D3/LuaSnip {:mod :luasnip}
  :saadparwaiz1/cmp_luasnip {}
  :Saecki/crates.nvim {:mod :crates}

  ;; Debugger
  :mfussenegger/nvim-dap {:opt false}

  ;; Vanity
  :lukas-reineke/indent-blankline.nvim {:mod :indent}
  :nvim-treesitter/nvim-treesitter {:mod :treesitter}
  :kevinhwang91/nvim-hlslens {:mod :hlslens}

  ;; Rust
  :rust-lang/rust.vim {:ft ["rust"]}
  :simrat39/rust-tools.nvim {}

  ;; Haskell
  :neovimhaskell/haskell-vim {:ft ["haskell"]}

  ;; Fennel
  :bakpakin/fennel.vim {:ft ["fennel"]}

  ;; Git
  :lewis6991/gitsigns.nvim {:mod :gitsigns :requires [[:nvim-lua/plenary.nvim]]}

  ;; Statusbar
  :nvim-lualine/lualine.nvim {:mod :lualine}
  :nvim-lua/lsp-status.nvim {}

  ;; Telescope
  :nvim-telescope/telescope-fzf-native.nvim {:run "make"}
  :nvim-telescope/telescope.nvim {:requires [[:nvim-lua/popup.nvim] [:nvim-lua/plenary.nvim]]}

  ;; Buffers
  :akinsho/bufferline.nvim {:mod :bufferline :requires [[:kyazdani42/nvim-web-devicons]]}
  :famiu/bufdelete.nvim {}

  ;; Icons
  :kyazdani42/nvim-web-devicons {:mod :devicons}

  ;; General editing
  :folke/trouble.nvim {:mod :trouble}
  :ggandor/lightspeed.nvim {}
  :windwp/nvim-autopairs {:mod :autopairs}
  :kylechui/nvim-surround {:mod :surround}
  :wellle/targets.vim {}
  :jghauser/mkdir.nvim {}
  :nkakouros-original/numbers.nvim {:mod :numbers}

  ;; Testaustime
  :testaustime/testaustime.nvim {:requires [[:nvim-lua/plenary.nvim]]
                                 :mod :testaustime}

  ;; nvim-cmp for completion
  :hrsh7th/cmp-nvim-lsp {}
  :hrsh7th/cmp-path {}
  :tzachar/cmp-fuzzy-buffer {:requires [[:hrsh7th/nvim-cmp] [:tzachar/fuzzy.nvim]]}
  :hrsh7th/nvim-cmp {:opt false
                     :requires [:hrsh7th/cmp-nvim-lsp
                                :hrsh7th/cmp-path]
                     :mod :cmp}

  :wbthomason/packer.nvim {})
