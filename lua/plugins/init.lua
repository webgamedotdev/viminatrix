return {
	'tpope/vim-fugitive',   -- Git commands in nvim
	'tpope/vim-repeat',     -- Enable repeating supported plugin maps with "."
	'nvim-lualine/lualine.nvim', -- Status line
	'folke/which-key.nvim',
	'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
	'ThePrimeagen/harpoon',
	'mbbill/undotree',
	{
		'RRethy/vim-illuminate', -- Highlight all instances of the word under the cursor
		config = function()
			vim.g.Illuminate_delay = 100
		end,
	},
	'github/copilot.vim',
	'christoomey/vim-tmux-navigator', -- Seamless navigation between tmux panes and vim splits
	{ 'akinsho/toggleterm.nvim', version = '*' },
	{ 'kylechui/nvim-surround',  version = '*' },
	'lewis6991/gitsigns.nvim',
	{
		'numToStr/Comment.nvim',
		config = function()
			require('Comment').setup()
		end,
	},
	{
		'nvim-neo-tree/neo-tree.nvim',
		branch = 'v2.x',
		dependencies = {
			'nvim-lua/plenary.nvim',
			'MunifTanjim/nui.nvim',
		},
	},
	{
		'nvim-treesitter/nvim-treesitter',
		build = function()
			require('nvim-treesitter.install').update({ with_sync = true })
		end,
	},
	'windwp/nvim-autopairs', -- Insert or delete brackets, parens, quotes in pair
	'windwp/nvim-ts-autotag', -- Automatically close HTML tags
	{
		'VonHeikemen/lsp-zero.nvim',
		dependencies = {
			-- LSP Support
			{ 'neovim/nvim-lspconfig' },
			{ 'williamboman/mason.nvim' },
			{ 'williamboman/mason-lspconfig.nvim' },

			-- Autocompletion
			{ 'hrsh7th/nvim-cmp' },
			{ 'hrsh7th/cmp-buffer' },
			{ 'hrsh7th/cmp-path' },
			{ 'saadparwaiz1/cmp_luasnip' },
			{ 'hrsh7th/cmp-nvim-lsp' },
			{ 'hrsh7th/cmp-nvim-lua' },

			-- Snippets
			{ 'L3MON4D3/LuaSnip' },
			{ 'rafamadriz/friendly-snippets' },
		},
	},
	{
		'nvim-telescope/telescope.nvim',
		dependencies = {
			{ 'nvim-lua/plenary.nvim' }, -- Lua utils methods shared with plugins
			{ 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
			{ 'nvim-telescope/telescope-github.nvim' },
		},
	},
	{
		'rose-pine/neovim',
	},

	{
		'lukas-reineke/indent-blankline.nvim',
		config = function()
			require('ibl').setup()
		end,
	},
	{
		'renerocksai/telekasten.nvim',
		dependencies = { 'nvim-telescope/telescope.nvim' },
	},
	{
		"ray-x/go.nvim",
		dependencies = { -- optional packages
			"ray-x/guihua.lua",
			"neovim/nvim-lspconfig",
			"nvim-treesitter/nvim-treesitter",
		},
		config = function()
			require("go").setup()
		end,
		event = { "CmdlineEnter" },
		ft = { "go", 'gomod' },
		build = ':lua require("go.install").update_all_sync()' -- if you need to install/update all binaries
	},
	{
		'stevearc/conform.nvim',
		event = 'LspAttach',
		opts = {
			quiet = true,
			formatters_by_ft = {
				typescript = { 'prettier' },
				typescriptreact = { 'prettier' },
				javascript = { 'prettier' },
				javascriptreact = { 'prettier' },
				json = { 'prettier' },
				html = { 'prettier' },
				css = { 'prettier' },
				scss = { 'prettier' },
				markdown = { 'prettier' },
				yaml = { 'prettier' },
				sh = { 'beautysh' },
				zsh = { 'beautysh' },
			},
			format_on_save = function(bufnr)
				-- Disable autoformat for files in a certain path
				local bufname = vim.api.nvim_buf_get_name(bufnr)
				if bufname:match('/node_modules/') then
					return
				end

				return { timeout_ms = 500, lsp_fallback = true, async = true }
			end,
			format_after_save = { lsp_fallback = true },
		},
		config = function(_, opts)
			local conform = require('conform')
			local util = require('conform.util')

			conform.setup(opts)

			-- Customize prettier args
			require('conform.formatters.prettier').args = function(ctx)
				local args = { '--stdin-filepath', '$FILENAME' }
				local localPrettierConfig = vim.fs.find('.prettierrc.json', {
					upward = true,
					path = ctx.dirname,
					type = 'file'
				})[1]
				local globalPrettierConfig = vim.fs.find('.prettierrc.json', {
					path = vim.fn.expand('~/.config/nvim'),
					type = 'file'
				})[1]

				-- Project config takes precedence over global config
				if localPrettierConfig then
					vim.list_extend(args, { '--config', localPrettierConfig })
				elseif globalPrettierConfig then
					vim.list_extend(args, { '--config', globalPrettierConfig })
				end

				local isUsingTailwind = vim.fs.find('tailwind.config.js', {
					upward = true,
					path = ctx.dirname,
					type = 'file'
				})[1]
				local localTailwindcssPlugin = vim.fs.find(
					'node_modules/prettier-plugin-tailwindcss/dist/index.mjs', {
						upward = true,
						path = ctx.dirname,
						type = 'file'
					})[1]

				if localTailwindcssPlugin then
					vim.list_extend(args, { '--plugin', localTailwindcssPlugin })
				else
					if isUsingTailwind then
						vim.notify(
							'Tailwind was detected for your project. You can really benefit from automatic class sorting. Please run npm i -D prettier-plugin-tailwindcss',
							vim.log.levels.WARN)
					end
				end

				return args
			end

			conform.formatters.beautysh = {
				prepend_args = function()
					return { '--indent-size', '2', '--force-function-style', 'fnpar' }
				end
			}
		end,
	}


}
