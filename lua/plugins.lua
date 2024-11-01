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

	{
		'scottmckendry/cyberdream.nvim',
		lazy = false,
		priority = 1000,
	},

	{
		-- Really good theme (carbonfox)
		'EdenEast/nightfox.nvim',
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

	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
			"MunifTanjim/nui.nvim",
			-- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
		}
	},

	{
		"folke/trouble.nvim",
		opts = {}, -- for default options, refer to the configuration section for custom setup.
		cmd = "Trouble",
		keys = {
			{
				"<leader>xx",
				"<cmd>Trouble diagnostics toggle<cr>",
				desc = "Diagnostics (Trouble)",
			},
			{
				"<leader>xX",
				"<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
				desc = "Buffer Diagnostics (Trouble)",
			},
			{
				"<leader>cs",
				"<cmd>Trouble symbols toggle focus=false<cr>",
				desc = "Symbols (Trouble)",
			},
			{
				"<leader>cl",
				"<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
				desc = "LSP Definitions / references / ... (Trouble)",
			},
			{
				"<leader>xL",
				"<cmd>Trouble loclist toggle<cr>",
				desc = "Location List (Trouble)",
			},
			{
				"<leader>xQ",
				"<cmd>Trouble qflist toggle<cr>",
				desc = "Quickfix List (Trouble)",
			},
		},
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

	-- might work
	{ 'simrat39/rust-tools.nvim' },
}
