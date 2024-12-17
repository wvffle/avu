local lush = require('lush')
local hsl = lush.hsl

local ayu_colors = require('ayu.colors')
local colors = {}
for name, hex in pairs(ayu_colors) do
  if type(hex) == "string" then
    colors[name] = hsl(hex)
  end
end

return colors
