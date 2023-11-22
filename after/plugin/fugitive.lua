local map = require('viminatrix.utils').map

-- Git (Fugitive)
map('n', '<leader>gg', ':G<cr>', { desc = 'Git status' })
map('n', '<leader>ga', '<cmd>Gwrite<cr>', { desc = 'Git add' })
map('n', '<leader>gc', '<cmd>Git commit<cr>', { desc = 'Git commit' })
map('n', '<leader>gd', '<cmd>Gdiffsplit<cr>', { desc = 'Git diff' })
map('n', '<leader>gl', '<cmd>Git log<cr>', { desc = 'Git log' })
map('n', '<leader>gp', '<cmd>Git pull<cr>', { desc = 'Git pull' })
map('n', '<leader>gP', '<cmd>Git push<cr>', { desc = 'Git push' })
