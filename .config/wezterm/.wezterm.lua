local wezterm = require("wezterm")
local config = wezterm.config_builder()
local dimmer = { brightness = 0 }
local border_color = "#bf6d36"
local cursor_color = "#bf6d36"
local border_width = 0
local bg_color = "#000000"
local first_color = "#000000"
config.font = wezterm.font("JetBrainsMono Nerd Font Mono", { weight = "Medium" })
config.font_size = 17
config.default_prog = { "pwsh" }
config.default_cwd = "D:/Local Disk D/Saif"
config.window_decorations = "RESIZE"
config.leader = { key = "Space", mods = "CTRL" }
config.adjust_window_size_when_changing_font_size = false
config.hide_tab_bar_if_only_one_tab = false
config.default_cursor_style = "BlinkingBlock"
config.animation_fps = 60
config.win32_system_backdrop = "Disable"
-- config.win32_system_backdrop = 'Acrylic'
-- config.win32_system_backdrop = 'Tabbed'
-- config.win32_system_backdrop = 'Mica'
config.window_background_opacity = 0.8
config.colors = {
	cursor_bg = cursor_color,
	cursor_fg = "#000000",
	cursor_border = cursor_color,
	tab_bar = {
		background = "#000000",
		active_tab = {
			bg_color = "#0b0022",
			fg_color = "#c0c0c0",
			intensity = "Normal",
			underline = "None",
			italic = false,
			strikethrough = false,
		},
		inactive_tab = {
			bg_color = "#000000",
			fg_color = "#808080",
		},
		inactive_tab_hover = {
			bg_color = "#000000",
			fg_color = "#909090",
			italic = true,
		},
		new_tab = {
			bg_color = "#000000",
			fg_color = "#808080",
		},
		new_tab_hover = {
			bg_color = "#000000",
			fg_color = "#909090",
			italic = true,
		},
	},
}
config.window_padding = {
	left = 6,
	right = 6,
	top = 6,
	bottom = 0,
}
config.keys = {
	{
		key = "s",
		mods = "CTRL",
		action = wezterm.action.PaneSelect,
	},
}
config.tab_bar_at_bottom = true
config.use_fancy_tab_bar = false
config.enable_tab_bar = false
config.background = {
	{
		source = {
			File = "/Documents and Settings/Admin/noise-text.png",
		},
		hsb = dimmer,
		height = 1000,
		width = 1000,
		attachment = { Parallax = 0.1 },
		opacity = 0,
	},
}
config.window_background_gradient = {
	colors = { bg_color, first_color },
	orientation = {
		Radial = {
			cx = 0.90,
			cy = 0.90,
			radius = 0.5,
		},
	},
}
-- config.disable_default_key_bindings = true
config.keys = {
	{
		key = "T",
		mods = "CTRL|SHIFT",
		action = wezterm.action.SpawnTab("CurrentPaneDomain"),
	},
	{ key = "H", mods = "CTRL|SHIFT", action = wezterm.action({ AdjustPaneSize = { "Left", 2 } }) },
	{ key = "J", mods = "CTRL|SHIFT", action = wezterm.action({ AdjustPaneSize = { "Down", 2 } }) },
	{ key = "K", mods = "CTRL|SHIFT", action = wezterm.action({ AdjustPaneSize = { "Up", 2 } }) },
	{ key = "L", mods = "CTRL|SHIFT", action = wezterm.action({ AdjustPaneSize = { "Right", 2 } }) },
	{ key = "Tab", mods = "CTRL|SHIFT", action = wezterm.action.PaneSelect },
	{ key = "Tab", mods = "CTRL", action = "ShowTabNavigator" }
}
config.window_frame = {
	border_left_color = border_color,
	border_right_color = border_color,
	border_bottom_color = border_color,
	border_top_color = border_color,
	border_left_width = border_width,
	border_right_width = border_width,
	border_bottom_height = border_width,
	border_top_height = border_width,
}
return config
