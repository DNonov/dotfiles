local status, lualine = pcall(require, "lualine")
local onedark = require'lualine.themes.onedark'
local onelight = require'lualine.themes.onelight'

if not status then
	return
end

lualine.setup()
