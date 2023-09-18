local wezterm = require("wezterm")
local config = {}

config.color_scheme = "Gruvbox Dark (Gogh)"
-- config.color_scheme = "Gruvbox (Gogh)"
config.font = wezterm.font("Cascadia Code", { weight = "Regular", stretch = "Normal", style = "Normal" })
config.font_size = 13.0

config.enable_tab_bar = false

config.window_background_opacity = 0.9
-- 
-- config.window_background_image = '/home/ebdemir/.config/nitrogen/wallpapers/diskette-wallpaper.jpg'
-- 
-- config.window_background_image_hsb = {
--     brightness = 0.3,
--     hue = 1.0,
-- }

return config
