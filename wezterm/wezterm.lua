local wezterm = require 'wezterm'
local mux = wezterm.mux
local config = wezterm.config_builder()

config.scrollback_lines = 5000
config.window_background_opacity = 0.85

-- Start maximized
wezterm.on('gui-startup', function(cmd)
	local _, _, window = mux.spawn_window(cmd or {})
	window:gui_window():maximize()
end)

config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}

config.hide_tab_bar_if_only_one_tab = true

config.window_decorations = 'RESIZE'

config.font_size = 15
config.font = wezterm.font_with_fallback({
	{ family = 'Hasklug Nerd Font' },
	{ family = 'Hack Nerd Font' },
	{ family = 'Hack' },
})

config.colors = {
	foreground = '#ffffff',
	background = '#000000',

	cursor_bg = "#ffffff",
	cursor_border = "#ffffff",
	cursor_fg = "#000000",

	ansi = {
		"#000000", -- black
		"#cd0000", -- red
		"#00cd00", -- green
		"#cdcd00", -- yellow
		"#5c5cff", -- blue
		"#cd00cd", -- magenta
		"#00cdcd", -- cyan
		"#e5e5e5", -- white
	},

	brights = {
		"#7f7f7f",
		"#ff0000",
		"#00ff00",
		"#ffff00",
		"#5c5cff",
		"#ff00ff",
		"#00ffff",
		"#ffffff",
	},
}

return config
