-- Install packer if it's not installed.
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()
-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
   -- Packer can manage itself
   use 'wbthomason/packer.nvim'
   use {
	   'nvim-telescope/telescope.nvim', tag = '0.1.1',
	   -- or                            , branch = '0.1.x',
	   requires = { {'nvim-lua/plenary.nvim'} }
   }
   use {
	   "nvim-telescope/telescope-file-browser.nvim",
	   requires = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
   }
   use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
   use('nvim-treesitter/playground')
   use('theprimeagen/harpoon')
   use('mbbill/undotree')
   use('tpope/vim-fugitive')
   use {
	   'VonHeikemen/lsp-zero.nvim',
	   branch = 'v1.x',
	   requires = {
		   -- LSP Support
		   {'neovim/nvim-lspconfig'},
		   {
			   'williamboman/mason.nvim',
			   run = function() pcall(vim.cmd, 'MasonUpdate') end
		   },
		   {'williamboman/mason-lspconfig.nvim'},

		   -- Autocompletion
		   {'hrsh7th/nvim-cmp'},
		   {'hrsh7th/cmp-buffer'},
		   {'hrsh7th/cmp-path'},
		   {'saadparwaiz1/cmp_luasnip'},
		   {'hrsh7th/cmp-nvim-lsp'},
		   {'hrsh7th/cmp-nvim-lua'},

		   -- Snippets
		   {'L3MON4D3/LuaSnip'},
		   {'rafamadriz/friendly-snippets'},
	   }
   }
   use("EdenEast/nightfox.nvim")
   use ("akinsho/toggleterm.nvim", { tag = '*'})
   use ('Mofiqul/vscode.nvim')
   if packer_bootstrap then 
      require('packer').sync()
   end
end)
