local wezterm = require('wezterm')

local M = {}

function M.apply_to_config(config)
  -- Window settings
  config.window_decorations = "RESIZE"
  config.window_padding = {
    left = 0,
    right = 0,
    top = 0,
    bottom = 0,
  }

    -- Setup Quake mode
    wezterm.on('gui-startup', function(cmd)
        local screen = wezterm.gui.screens().active
        local tab, pane, window = wezterm.mux.spawn_window(cmd or {})
        local gui_window = window:gui_window()
    
        -- Position at top of screen and take full width
        gui_window:set_position(0, 0)
        gui_window:set_inner_size(screen.width, screen.height / 3)
        
        -- Additional quake-style settings
        gui_window:set_window_decorations(false)
        gui_window:maximize()
      end)

  -- Position and size
  config.initial_rows = 40
  config.window_close_confirmation = 'NeverPrompt'

  -- Appearance
  config.window_background_opacity = 0.80
  config.macos_window_background_blur = 5

  -- Animation (smoother appearance/disappearance)
  config.animation_fps = 60
  config.native_macos_fullscreen_mode = false
  config.unix_domains = {}
  config.default_gui_startup_args = { 'start', '--always-new-process' }

  return config
end

return M
