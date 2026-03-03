local wezterm = require 'wezterm'

local config = wezterm.config_builder()
config.automatically_reload_config = true

config.use_ime = true

config.color_scheme = 'GitHub Dark'

config.keys = require("keybinds").keys
config.key_tables = require("keybinds").key_tables

return config
