local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

return require('packer').startup(function(use)
  -- My plugins here
  -- use 'foo1/bar1.nvim'
  use 'wbthomason/packer.nvim'

  -- Themes
  -- main theme
  use 'navarasu/onedark.nvim'
  use 'morhetz/gruvbox'
  -- airline
  use {
    'nvim-lualine/lualine.nvim',
    requires = {'kyazdani42/nvim-web-devicons', opt = true}
  }
  use { 'alvarosevilla95/luatab.nvim', 
    requires='kyazdani42/nvim-web-devicons' 
  }
  use {
	"SmiteshP/nvim-gps",
	requires = "nvim-treesitter/nvim-treesitter"
  }

  -- Files & Folders
  use {
    'kyazdani42/nvim-tree.lua',
    requires = 'kyazdani42/nvim-web-devicons',
    config = function() require'nvim-tree'.setup {} end
  }
  -- FZF file/content search
  use '/usr/local/opt/fzf'
  use 'junegunn/fzf.vim'
  use {
	'nvim-telescope/telescope.nvim',
	requires = { {'nvim-lua/plenary.nvim'} }
  }

  -- Git
  use 'tpope/vim-fugitive'
  use {
	'lewis6991/gitsigns.nvim',
	requires = {
	'nvim-lua/plenary.nvim'
	},
  }
  use 'junegunn/gv.vim'
  use 'tpope/vim-rhubarb'

  -- Code helpers
  -- Easy commenting
  use 'tpope/vim-commentary'
  -- Gives mappings to surround text with special chars
  use 'tpope/vim-surround'
  -- Gives mappings with ] [
  use 'tpope/vim-unimpaired'
  -- Gives repeat for above
  use 'tpope/vim-repeat'
  -- Provides automatic closing brackets
  use 'Raimondi/delimitMate'
  -- Provides support for Jekyll liquid
  use 'tpope/vim-liquid'
  -- Fancy startup
  use 'mhinz/vim-startify'
  -- snippets
  use 'SirVer/ultisnips'
  use 'honza/vim-snippets'
  -- Tree sitter simple and easy way to use the interface for tree-sitter in Neovim 
  use {
	'nvim-treesitter/nvim-treesitter',
	run = ':TSUpdate'
  }
  use 'nvim-treesitter/playground'
  use 'nvim-treesitter/nvim-treesitter-textobjects'
  -- Markdown preview
  use 'iamcco/markdown-preview.nvim' 
  -- Toggle term
  use {
	  "akinsho/toggleterm.nvim",
	  config = function()
	  	require("toggleterm").setup {
			open_mapping = [[<c-\>]]
		}
	  end
  }
  use 'liuchengxu/vim-which-key'
  -- Supertab is a vim plugin which allows you to use <Tab> for all your insert completion needs
  use 'ervandew/supertab'
  -- code completion - LSP
  use 'neovim/nvim-lspconfig'
  use 'williamboman/nvim-lsp-installer'
  use 'onsails/lspkind-nvim'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp'

  -- Lua
  -- A pretty list for showing diagnostics, references, telescope results, quickfix and 
  -- location lists to help you solve all the trouble your code is causing.
  use {
  "folke/trouble.nvim",
  requires = "kyazdani42/nvim-web-devicons",
  config = function()
  	require("trouble").setup {
  	-- your configuration comes here
  	-- or leave it empty to use the default settings
  	-- refer to the configuration section below
  	}
  end
  }

  -- GPG
  use 'jamessan/vim-gnupg'

  -- Tables
  use 'godlygeek/tabular'
  use 'dhruvasagar/vim-table-mode'

  -- Browser integration
  use {
    'glacambre/firenvim',
    run = function() vim.fn['firenvim#install'](0) end 
  }

  -- Easy motion
  use 'justinmk/vim-sneak'

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
