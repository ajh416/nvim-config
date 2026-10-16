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
		-- Really good theme (carbonfox)
		'EdenEast/nightfox.nvim',
	},

	{
		'rmehri01/onenord.nvim',
	},

	{
		'navarasu/onedark.nvim',
	},

	{
		"scottmckendry/cyberdream.nvim",
		lazy = false,
		priority = 1000,
	},

	-- Nice status line
	{
		'nvim-lualine/lualine.nvim',
		lazy = false,
	},

	{
		'MeanderingProgrammer/render-markdown.nvim',
		dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.nvim' }, -- if you use the mini.nvim suite
		-- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use standalone mini plugins
		-- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
		---@module 'render-markdown'
		---@type render.md.UserConfig
		opts = {},
	},

	-- Shows indents
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		---@module "ibl"
		---@type ibl.config
		opts = {},
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
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		dependencies = { "nvim-lua/plenary.nvim" }
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

	-- LSP Section
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

	{
		"lervag/vimtex",
		lazy = false,     -- we don't want to lazy load VimTeX
		-- tag = "v2.15", -- uncomment to pin to a specific release
		init = function()
			-- VimTeX configuration goes here, e.g.
			vim.g.vimtex_view_method = "zathura"
		end
	},

	{
		'nvim-treesitter/nvim-treesitter',
		branch = 'main', -- the rewrite: no `configs` module, no `opts`, highlighting is opt-in per filetype
		lazy = false, -- main does not support lazy-loading
		build = ':TSUpdate',
		config = function()
			-- Installs whatever is missing (async, needs the tree-sitter CLI)
			require('nvim-treesitter').install({
				'c', 'cpp', 'python', 'lua', 'vim', 'vimdoc', 'bash', 'rust',
				'markdown', 'markdown_inline', 'latex',
				'javascript', 'typescript', 'html', 'css', 'json',
			})

			vim.api.nvim_create_autocmd('FileType', {
				desc = 'Start treesitter highlighting when a parser exists',
				callback = function(args)
					pcall(vim.treesitter.start, args.buf)
				end,
			})
		end,
	},

	-- Claude Code / Codex in a terminal split (NES is off: it needs Copilot's LSP)
	{
		'folke/sidekick.nvim',
		opts = {
			nes = { enabled = false },
			cli = {
				mux = { enabled = false },
				tools = { claude = {}, codex = {} },
			},
		},
		keys = {
			{ '<leader>oo', function() require('sidekick.cli').toggle() end, desc = 'Sidekick: toggle CLI' },
			{ '<leader>os', function() require('sidekick.cli').select() end, desc = 'Sidekick: select CLI' },
			{ '<leader>op', function() require('sidekick.cli').prompt() end, mode = { 'n', 'x' }, desc = 'Sidekick: pick prompt' },
			{ '<leader>ot', function() require('sidekick.cli').send({ msg = '{this}' }) end, mode = { 'n', 'x' }, desc = 'Sidekick: send this' },
			{ '<leader>of', function() require('sidekick.cli').send({ msg = '{file}' }) end, desc = 'Sidekick: send file' },
			{ '<leader>ov', function() require('sidekick.cli').send({ msg = '{selection}' }) end, mode = 'x', desc = 'Sidekick: send selection' },
		},
	},

	-- LSP setup in after/plugin/lsp.lua (uses the built-in vim.lsp.config / vim.lsp.enable)
	{ 'mason-org/mason.nvim' },
	{ 'mason-org/mason-lspconfig.nvim' }, -- auto-enables servers installed via mason
	{ 'neovim/nvim-lspconfig' }, -- supplies the default server configs (lsp/*.lua)

	-- Completion framework
	{
		'saghen/blink.cmp',
		version = '1.*', -- release tags ship a prebuilt fuzzy-matching binary
		opts = {
			keymap = {
				preset = 'enter', -- <CR> accepts, <C-n>/<C-p> select, <C-e> hides, <C-space> shows
				-- Tab: accept the AI ghost text if visible, else jump snippet, else a normal Tab
				['<Tab>'] = {
					function()
						local vt = require('minuet.virtualtext').action
						if vt.is_visible() then
							vt.accept()
							return true
						end
					end,
					'snippet_forward',
					'fallback',
				},
			},
		},
	},

	-- AI completion (DeepSeek FIM; needs DEEPSEEK_API_KEY in your environment)
	{
		'milanglacier/minuet-ai.nvim',
		dependencies = { 'nvim-lua/plenary.nvim' },
		config = function(_, opts)
			require('minuet').setup(opts)
			-- :colorscheme runs `hi clear`, which wipes the group minuet defines on load,
			-- leaving ghost text in the normal text colour. Re-link it after every scheme.
			local function link_ghost_text()
				vim.api.nvim_set_hl(0, 'MinuetVirtualText', { link = 'Comment' })
			end
			link_ghost_text()
			vim.api.nvim_create_autocmd('ColorScheme', { callback = link_ghost_text })
		end,
		opts = {
			provider = 'openai_fim_compatible',
			virtualtext = {
				auto_trigger_ft = { '*' }, -- ghost text on idle in every filetype
				-- Otherwise the ghost text is suppressed whenever blink's menu is open,
				-- which is almost always while typing prose
				show_on_completion_menu = true,
				keymap = {
					-- <Tab> to accept is mapped in blink.cmp above so it can fall through
					accept_line = '<C-k>',
					next = '<C-l>', -- cycle suggestions, or request one manually
				},
			},
			debounce = 800, -- ms of no typing before a request is sent (plugin default: 400)
			throttle = 1500, -- and at most one request per this many ms
			n_completions = 1, -- for FIM models each completion is a separate request
			context_window = 6000, -- characters of context around the cursor
			provider_options = {
				openai_fim_compatible = {
					model = 'deepseek-flash', -- was deepseek-v4-flash; FIM is non-thinking only
					api_key = 'DEEPSEEK_API_KEY', -- name of the env var, not the key itself
					name = 'deepseek',
					optional = {
						max_tokens = 256,
						top_p = 0.9,
					},
				},
			},
		},
	},

	{
		'mrcjkb/rustaceanvim',
		version = '^5', -- Recommended
		lazy = false, -- This plugin is already lazy
	}
}
