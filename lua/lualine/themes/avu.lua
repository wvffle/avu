local colors = require("avu.colors")

return {
  normal = {
    a = { bg = colors.entity.hex, fg = colors.bg.hex, gui = "bold" },
    b = { bg = colors.visual.hex, fg = colors.fg.hex },
    c = { bg = colors.bg.hex, fg = colors.ui.hex },
  },
  insert = {
    a = { bg = colors.string.hex, fg = colors.bg.hex, gui = "bold" },
    b = { bg = colors.visual.hex, fg = colors.fg.hex },
    c = { bg = colors.bg.hex, fg = colors.ui.hex },
  },
  visual = {
    a = { bg = colors.accent.hex, fg = colors.bg.hex, gui = "bold" },
    b = { bg = colors.visual.hex, fg = colors.fg.hex },
    c = { bg = colors.bg.hex, fg = colors.ui.hex },
  },
  replace = {
    a = { bg = colors.markup.hex, fg = colors.bg.hex, gui = "bold" },
    b = { bg = colors.visual.hex, fg = colors.fg.hex },
    c = { bg = colors.bg.hex, fg = colors.ui.hex },
  },
  command = {
    a = { bg = colors.keyword.hex, fg = colors.bg.hex, gui = "bold" },
    b = { bg = colors.visual.hex, fg = colors.fg.hex },
    c = { bg = colors.bg.hex, fg = colors.ui.hex },
  },
  inactive = {
    a = { bg = colors.bg.hex, fg = colors.ui.hex, gui = "bold" },
    b = { bg = colors.bg.hex, fg = colors.ui.hex },
    c = { bg = colors.bg.hex, fg = colors.ui.hex },
  },
}
