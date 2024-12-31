local lush = require('lush')
local hsl = lush.hsl

local colors = {
  white = hsl('#FFFFFF'),
  black = hsl('#000000'),

  -- Ayu dark colors from https://github.com/Shatur/neovim-ayu/blob/2839c88cd297a069e93df1aab542c087e8f6e8c0/lua/ayu/colors.lua#L52-L91
  accent = hsl('#E6B450'),
  bg = hsl('#0B0E14'),
  fg = hsl('#BFBDB6'),
  ui = hsl('#565B66'),

  tag = hsl('#39BAE6'),
  func = hsl('#FFB454'),
  entity = hsl('#59C2FF'),
  string = hsl('#AAD94C'),
  regexp = hsl('#95E6CB'),
  markup = hsl('#F07178'),
  keyword = hsl('#FF8F40'),
  special = hsl('#E6B673'),
  comment = hsl('#636A72'),
  constant = hsl('#D2A6FF'),
  operator = hsl('#F29668'),
  error = hsl('#D95757'),
  lsp_parameter = hsl('#CB9FF8'),

  line = hsl('#11151C'),
  panel_bg = hsl('#0F131A'),
  panel_shadow = hsl('#05070A'),
  panel_border = hsl('#000000'),
  gutter_normal = hsl('#454B55'),
  gutter_active = hsl('#626975'),
  guide_active = hsl('#3C414A'),
  guide_normal = hsl('#1E222A'),

  vcs_added = hsl('#7FD962'),
  vcs_modified = hsl('#73B8FF'),
  vcs_removed = hsl('#F26D78'),

  vcs_added_bg = hsl('#1D2214'),
  vcs_removed_bg = hsl('#2D2220'),

  fg_idle = hsl('#565B66'),
  warning = hsl('#FF8F40'),

  visual = hsl('#23344B'),

  lsp_inlay_hint = hsl('#969696'),
}


colors.selection_bg = colors.bg
colors.selection_inactive = colors.panel_bg
colors.selection_border = colors.panel_border

return colors
