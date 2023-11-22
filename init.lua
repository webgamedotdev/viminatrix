-- The GM
-- https://www.webgame.dev
-- https://github.com/webgamedev/viminatrix

vim.loader.enable() -- Speed up startup

require('viminatrix.lazy') -- Lazy load plugins
require('viminatrix.settings') -- Define global settings
require('viminatrix.keymaps') -- Define global keymaps
require('viminatrix.autocommands') -- Define global autocommands
