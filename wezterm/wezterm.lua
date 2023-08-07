local wezterm = require("wezterm")
local config = {}

config.color_scheme = "Gruvbox Dark (Gogh)"
config.font = wezterm.font("Cascadia Code", { weight = "Regular", stretch = "Normal", style = "Normal" })
config.font_size = 13.0

config.enable_tab_bar = false

return config
