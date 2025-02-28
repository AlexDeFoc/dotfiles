local wezterm = require 'wezterm'
local config = {}

-- Font
config.font = wezterm.font {
	family = 'FiraCode Nerd Font Mono',
	harfbuzz_features = { 'calt=1', 'clig=1', 'liga=1', 'ss04', 'ss03', 'cv12', 'ss07'},
	assume_emoji_presentation = true
}

-- Colorscheme
config.colors = {
	-- Text color
	foreground = 'white',

	-- Text background color
	background = 'black',
	
	-- Cursor cell text color
	cursor_fg = 'black',

	-- Cursor cell background color
	cursor_bg = 'orange',

	-- Cursor cell border when out of focus
	cursor_border = 'red',

	-- Text color when selected
	selection_fg = 'black',

	-- Text background color when selected
	selection_bg = 'white',

	-- Color for line of split between panes
	split = 'white',

	-- Idk, used by windows?
	ansi = {
	    'black',
	    'maroon',
	    'green',
	    'olive',
	    'darkslateblue', -- Folders
	    'purple',
	    'teal',
	    'silver',
	  },
	  brights = {
	    'lime', -- Command parameters
	    'red',
	    'green', -- Executables
	    'yellow', -- Commands
	    'blue',
	    'fuchsia',
	    'aqua', -- Symbolic links
	    'white',
  	},

	-- Tab bar
	tab_bar = {
		-- Tab bar strip background
		background = 'black',

		-- Active tab
		active_tab = {
			-- Background color
			bg_color = 'indigo',
			
			-- Text color
			fg_color = 'white',

			-- Text intensity
			intensity = 'Normal'
		},

		-- Other/Inactive tabs
		inactive_tab = {
			-- Background color
			bg_color = '#252728',
			
			-- Text color
			fg_color = 'white',

			-- Text intensity
			intensity = 'Normal'
		},

		-- Hovering on other/inactive tabs
		inactive_tab_hover = {
			-- Background color
			bg_color = '#252728',
			
			-- Text color
			fg_color = 'white',

			-- Text intensity
			intensity = 'Normal'
		},

		-- New tab button
		new_tab = {
			-- Background color
			bg_color = 'white',
			
			-- Text color
			fg_color = 'black',

			-- Text intensity
			intensity = 'Normal'
		},

		-- Hovering on the new tab button
		new_tab_hover = {
			-- Background color
			bg_color = 'white',
			
			-- Text color
			fg_color = 'black',

			-- Text intensity
			intensity = 'Normal'
		}
	}
}

-- Tab bar configuration
config.use_fancy_tab_bar = false
config.hide_tab_bar_if_only_one_tab = false
config.tab_bar_at_bottom = true

-- Shell (shell and args)
config.default_prog = { 'C:/Program Files/PowerShell/7/pwsh.exe' }

-- Current working directory
config.default_cwd = 'C:/orbit'

return config