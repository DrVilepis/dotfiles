local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

return require('packer').startup(function()
    -- Plugin manager itself
	use 'wbthomason/packer.nvim'
 	
    -- Autocompletion and snippets
 	use 'neovim/nvim-lspconfig'
 	use { 'ms-jpq/coq_nvim', branch = 'coq', run = ':COQdeps'}
 	use { 'ms-jpq/coq.artifacts', branch = 'artifacts' }
 	use 'norcalli/snippets.nvim'  
 
    -- Navigation
    use 'ggandor/lightspeed.nvim'

    -- General ui utils
 	use {
 	  'kyazdani42/nvim-tree.lua',
 	  requires = 'kyazdani42/nvim-web-devicons'
 	}
 	use {
 	  'hoob3rt/lualine.nvim',
 	  requires = {'kyazdani42/nvim-web-devicons', opt = true}
 	}
    use {'akinsho/bufferline.nvim', requires = 'kyazdani42/nvim-web-devicons'}
 
    -- Language plugins
 	use 'elkowar/yuck.vim'
 	use 'simrat39/rust-tools.nvim'
    use 'Saecki/crates.nvim'
 	use 'euclidianAce/BetterLua.vim'
    use 'twh2898/vim-scarpet'

    -- Debugging
    use 'mfussenegger/nvim-dap'
 
    -- General libraries
 	use 'nvim-lua/popup.nvim'
 	use 'nvim-lua/plenary.nvim' 

    -- Fuzzy finder
    use {
        'nvim-telescope/telescope.nvim',
        requires = { {'nvim-lua/plenary.nvim'} }
    }
 
    -- Syntax highlighting and colorscheme
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
    -- use 'sainnhe/everforest'
    -- use "rafamadriz/neon"
    use 'norcalli/nvim-base16.lua'

    -- Git utilities
    use {'lewis6991/gitsigns.nvim', requires = {'nvim-lua/plenary.nvim'}}

    -- General ui
    use 'lukas-reineke/indent-blankline.nvim'
    --use 'sindrets/diffview.nvim'
    use 'folke/trouble.nvim'

    if packer_bootstrap then
		require('packer').sync()
    end
end)
