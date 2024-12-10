local wezterm = require('wezterm')
local quake = require('quake')
local config = {}

if wezterm.config_builder then
  config = wezterm.config_builder()
end

config.default_cwd = wezterm.home_dir .. '/Projects'

config.keys = {
  -- Jump words
  {
    key = 'LeftArrow',
    mods = 'OPT',
    action = wezterm.action.SendString '\x1bb',
  },
  {
    key = 'RightArrow',
    mods = 'OPT',
    action = wezterm.action.SendString '\x1bf',
  },
  -- Open VS Code in the WezTerm config directory
  {
    key = ',',
    mods = 'SUPER',
    action = wezterm.action.SpawnCommandInNewTab {
      cwd = wezterm.home_dir,
      args = { 'code', '.config/wezterm' },
    },
  },
  -- Split panes
  {
    key = 'd',
    mods = 'CMD',
    action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' },
  },
  {
    key = 'D',
    mods = 'CMD|SHIFT',
    action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' },
  },
  -- Navigate between panes
  {
    key = '[',
    mods = 'CMD',
    action = wezterm.action.ActivatePaneDirection 'Prev',
  },
  {
    key = ']',
    mods = 'CMD',
    action = wezterm.action.ActivatePaneDirection 'Next',
  },
  {
    key = '=',
    mods = 'CMD|OPT',
    action = wezterm.action.SpawnCommandInNewTab {
      cwd = wezterm.home_dir .. '/Projects',
    },
  },
  {
    key = '-',
    mods = 'CMD|OPT',
    action = wezterm.action.SpawnCommandInNewTab {
      cwd = wezterm.cwd,
    },
  },
}

config = quake.apply_to_config(config)

return config
