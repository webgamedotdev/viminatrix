local home = vim.fn.expand('~/note-vault')
require('telekasten').setup({
  home = home,
  -- dir names for special notes (absolute path or subdir name)
  dailies = home .. '/' .. 'dailies',
  weeklies = home .. '/' .. 'weeklies',
  templates = home .. '/' .. 'templates',
  image_subdir = 'images',

  template_new_note = home .. '/' .. 'templates/new_note.md',
  template_new_daily = home .. '/' .. 'templates/daily.md',
  template_new_weekly = home .. '/' .. 'templates/weekly.md',

  -- image link style
  -- wiki:     ![[image name]]
  -- markdown: ![](image_subdir/xxxxx.png)
  image_link_style = 'markdown',
})
