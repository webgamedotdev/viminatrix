local map = require('viminatrix.utils').map
local mark = require('harpoon.mark')
local ui = require('harpoon.ui')

map('n', '<leader>a', mark.add_file, { desc = 'Add file to harpoon' })
map('n', '<leader>h', ui.toggle_quick_menu, { desc = 'Toggle harpoon menu' })

map('n', '<leader>1', function()
  ui.nav_file(1)
end, { desc = 'Harpoon file #1' })
map('n', '<leader>2', function()
  ui.nav_file(2)
end, { desc = 'Harpoon file #2' })
map('n', '<leader>3', function()
  ui.nav_file(3)
end, { desc = 'Harpoon file #3' })
map('n', '<leader>4', function()
  ui.nav_file(4)
end, { desc = 'Harpoon file #4' })
