require('plenary.reload').reload_module('lualine', true)
require('lualine').setup({
  options = {
      icons_enabled = true,
      theme = 'auto',
    disabled_types = { 'NvimTree' }
  },
  sections = {
    lualine_x = {},
    -- lualine_y = {},
    -- lualine_z = {},
  }
})
