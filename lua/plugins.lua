return {
	-- Color scheme
	{
		'neanias/everforest-nvim',
		lazy = false,
	},

	{ 
		'rebelot/kanagawa.nvim', 
		lazy = false,
	},

	-- Nice status line
	{
		'nvim-lualine/lualine.nvim',
		lazy = false,
	},

	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		event = "InsertEnter",
		config = function()
			require("copilot").setup()
		end
	},

	{
		"zbirenbaum/copilot-cmp",
		config = function ()
			require("copilot_cmp").setup()
		end
	},

	-- Displays colors in nvim (css and html)
	{ 'norcalli/nvim-colorizer.lua' },

	-- Fuzzy finder
	{
		'nvim-telescope/telescope.nvim', tag = '0.1.8',
		-- or                              , branch = '0.1.x',
		dependencies = { 'nvim-lua/plenary.nvim' }
	},

	-- Syntax highlighter
	{ 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' },

	-- LSP setup in after/plugin/lsp.lua
	{ 'williamboman/mason.nvim' },
	{ 'williamboman/mason-lspconfig.nvim' },
	{ 'neovim/nvim-lspconfig' },

	-- Completion framework:
	{ 'hrsh7th/nvim-cmp' },

	-- LSP completion source:
	{ 'hrsh7th/cmp-nvim-lsp' },

	-- Useful completion sources:
	{ 'hrsh7th/cmp-nvim-lua' },
	{ 'hrsh7th/cmp-nvim-lsp-signature-help' },
	{ 'hrsh7th/cmp-vsnip' },                             
	{ 'hrsh7th/cmp-path' },                              
	{ 'hrsh7th/cmp-buffer' },                           
	{ 'hrsh7th/vim-vsnip' },

	-- doesn't seem to work
	{ 'simrat39/rust-tools.nvim' },
}
