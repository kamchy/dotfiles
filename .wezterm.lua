-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
config.color_scheme = 'Gruvbox Dark (Gogh)'
config.font_size=14
config.tab_bar_at_bottom = true
config.inactive_pane_hsb = {
  saturation = 0.9,
  brightness = 0.8,
}
config.font = wezterm.font ('JetBrainsMonoNerdFont')
--config.window_background_opacity = 0.3

-- and finally, return the configuration to wezterm
return config
