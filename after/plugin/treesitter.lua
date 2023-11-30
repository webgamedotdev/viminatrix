require('nvim-treesitter.configs').setup({
	ensure_installed = {
		-- required
		'vim',

		-- scripting
		'bash',

		-- frontend
		'html',
		'css',
		'scss',
		'javascript',
		'jsdoc',
		'typescript',
		'tsx',

		-- languages
		'lua',
		'go',
		'python',
		'zig',
		'rust',

		-- config/data
		'json',
		'yaml',
		'dockerfile',
	},
	highlight = {
		enable = true,
		disable = {},
	},
	indent = {
		enable = true,
		disable = {},
	},
	autopairs = {
		enable = true,
	},
	autotag = {
		enable = true,
	},
})

local parser_config = require('nvim-treesitter.parsers').get_parser_configs()
parser_config.tsx.filetype_to_parsername = { 'javascript', 'typescript.tsx' }
