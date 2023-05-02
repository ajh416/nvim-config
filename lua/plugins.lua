-- Ensure that packer is installed to wherever this nvim config is
-- Returns true if packer was installed through this function
local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
		vim.cmd[[packadd packer.nvim]]
		return true
	end
	return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'
	
	-- Color scheme
	use {
		'neanias/everforest-nvim'
	}
	
	-- Nice status line
	use {
		'nvim-lualine/lualine.nvim'
	}
	
	-- Displays colors in nvim (css and html)
	use 'norcalli/nvim-colorizer.lua'

	-- Fuzzy finder
	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.0',
		requires = { {'nvim-lua/plenary.nvim'} }
	}

	-- Syntax highlighter
	use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})

	-- LSP setup in after/plugin/lsp.lua
	use {
		'williamboman/mason.nvim',
		'williamboman/mason-lspconfig.nvim',
		'neovim/nvim-lspconfig',
		'hrsh7th/nvim-cmp',
		'hrsh7th/cmp-nvim-lsp',
		'hrsh7th/cmp-buffer',
		'hrsh7th/cmp-path',
	}

	-- If packer just installed, install plugins
	if packer_bootstrap then
		require('packer').sync()
	end
end)
