(local plugins (require "dots.plugins"))
(local utils (require "dots.utils"))

(set vim.o.termguicolors true)
(set vim.o.tabstop 4)
(set vim.o.shiftwidth 4)
(set vim.o.softtabstop 4)
(set vim.o.expandtab true)
(set vim.g.mapleader " ")
(set vim.g.maplocalleader " ")
(set vim.o.mouse :a)
(set vim.o.number true)
(set vim.o.relativenumber true)
(set vim.g.indent_blankline_use_treesitter true)
(set vim.o.cmdheight 1)
(set vim.o.scrolloff 3)
(set vim.o.cursorline true)
(set vim.o.ignorecase true)
(set vim.o.smartcase true)
(set vim.o.hlsearch true)
(set vim.o.signcolumn "yes:1")
(set vim.o.colorcolumn "+1")
(set vim.o.splitright true)

(plugins.use {
  ;; Starting speed
  :lewis6991/impatient.nvim {}

  ;; Fennel
  :udayvir-singh/tangerine.nvim {}

  ;; Deps
  :nvim-lua/plenary.nvim {}

  ;; Lsp
  :neovim/nvim-lspconfig {:mod :lsp}

  ;; Important
  :rcarriga/nvim-notify {:mod :notify}

  ;; Snippets
  :L3MON4D3/LuaSnip {:mod :luasnip}
  :saadparwaiz1/cmp_luasnip {}
  :Saecki/crates.nvim {:mod :crates}

  ;; Debugger
  :mfussenegger/nvim-dap {}

  ;; Vanity
  :lukas-reineke/indent-blankline.nvim {:mod :indent}
  :nvim-treesitter/nvim-treesitter {:mod :treesitter}
  :nkrkv/nvim-treesitter-rescript {}
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
  :nvim-telescope/telescope-fzf-native.nvim {:build "make"}
  :nvim-telescope/telescope.nvim {:requires [[:nvim-lua/popup.nvim] [:nvim-lua/plenary.nvim]]
                                  :mod :telescope}
  :stevearc/dressing.nvim {:mod :dressing}

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
  :tzachar/fuzzy.nvim {}
  :tzachar/cmp-fuzzy-buffer {:requires [[:hrsh7th/nvim-cmp] [:tzachar/fuzzy.nvim]]}
  :hrsh7th/nvim-cmp {:opt false
                     :requires [:hrsh7th/cmp-nvim-lsp
                                :hrsh7th/cmp-path]
                     :mod :cmp}})

;; Setup

(require :dots.keybinds)
(require :dots.filetypes)

(vim.api.nvim_create_autocmd ["BufWritePre"] {:callback utils.trim_trailing_whitespaces})

(require :dots.theme)
