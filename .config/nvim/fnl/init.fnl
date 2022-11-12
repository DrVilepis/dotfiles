(module vile-nvim
  {autoload {a aniseed.core
             nvim aniseed.nvim
             plugins dots.plugins
             utils dots.utils}})

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

(require "dots.keybinds")

(local ftcmds {"nroff" (fn [] (set nvim.o.expandtab false))})

;; Testaustime options
(vim.api.nvim_create_autocmd ["BufWritePre"] {:callback utils.trim_trailing_whitespaces})
(vim.api.nvim_create_autocmd ["BufEnter"] {:callback (fn [] (let [callback (?. ftcmds nvim.bo.filetype)] (when callback (callback))))})
(vim.api.nvim_create_autocmd ["BufRead" "BufNewFile"] {:pattern ["*.vert" "*.frag"]
                                                       :callback (fn [] (set vim.o.filetype :glsl))})

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
  :nvim-telescope/telescope-dap.nvim {:requires [:mfussenegger/nvim-dap
                                                 :nvim-telescope/telescope.nvim]
                                      :mod :telescope}

  ;; Vanity
  :lukas-reineke/indent-blankline.nvim {:mod :indent}
  :nvim-treesitter/nvim-treesitter {:mod :treesitter}
  :petertriho/nvim-scrollbar {:mod :scrollbar}

  ;; Rust
  :rust-lang/rust.vim {:ft ["rust"]}
  :simrat39/rust-tools.nvim {}

  ;; Haskell
  :neovimhaskell/haskell-vim {:ft ["haskell"]}

  ;; Fennel
  :bakpakin/fennel.vim {:ft ["fennel"]}
  :norcalli/nvim-base16.lua {:mod :gruvbox}

  ;; Git
  :lewis6991/gitsigns.nvim {:mod :gitsigns :requires [[:nvim-lua/plenary.nvim]]}
  :TimUntersberger/neogit {:requires [[:nvim-lua/plenary.nvim]]}

  ;; Statusbar
  :nvim-lualine/lualine.nvim {:mod :lualine}
  :nvim-lua/lsp-status.nvim {}

  ;; Telescope
  :nvim-telescope/telescope.nvim {:requires [[:nvim-lua/popup.nvim] [:nvim-lua/plenary.nvim]]}
  :LinArcX/telescope-env.nvim {}
  :luc-tielen/telescope_hoogle {}

  ;; Buffer tabs
  :akinsho/bufferline.nvim {:mod :bufferline :requires [[:kyazdani42/nvim-web-devicons]]}

  ;; File tree
  :kyazdani42/nvim-tree.lua {:requires [:kyazdani42/nvim-web-devicons]
                             :tag :nightly
                             :mod :nvim-tree}

  ;; Icons
  :kyazdani42/nvim-web-devicons {:mod :devicons}

  ;; General editing
  :folke/trouble.nvim {:mod :trouble}
  :ggandor/lightspeed.nvim {}
  :windwp/nvim-autopairs {}
  :kylechui/nvim-surround {:mod :surround}
  :wellle/targets.vim {}
  :jghauser/mkdir.nvim {}
  :nkakouros-original/numbers.nvim {:mod :numbers}

  ;; Marks
  :chentoast/marks.nvim {:mod marks}

  ;; Testaustime
  :testaustime/testaustime.nvim {:requires [[:nvim-lua/plenary.nvim]]
                                 :mod :testaustime}

  ;; nvim-cmp for completion
  :hrsh7th/cmp-nvim-lsp {}
  :hrsh7th/cmp-path {}
  :hrsh7th/nvim-cmp {:opt false
                     :requires [:hrsh7th/cmp-nvim-lsp
                                :hrsh7th/cmp-path]
                     :mod :cmp}

  :wbthomason/packer.nvim {})
