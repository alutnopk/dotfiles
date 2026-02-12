-- Adopted from https://alexplescan.com/posts/2024/08/10/wezterm/

-- Import the wezterm module
local wezterm = require 'wezterm'
-- Creates a config object which we will be adding our config to
local config = wezterm.config_builder()
-- Import our new module (put this near the top of your wezterm.lua)
local appearance = require 'appearance'

-- Use it!
if appearance.is_dark() then
  config.color_scheme = 'Catppuccin Mocha'
else
  config.color_scheme = 'Catppuccin Latte'
end

config.scrollback_lines = 99999999

-- (This is where our config will go)
-- Choose your favourite font, make sure it's installed on your machine
config.font = wezterm.font({ family = 'Hurmit Nerd Font' })
-- And a font size that won't have you squinting
config.font_size = 14

config.color_scheme = 'Tokyo Night'
config.window_background_opacity = 0.9

-- Removes the title bar, leaving only the tab bar. Keeps
-- the ability to resize by dragging the window's edges.
-- On macOS, 'RESIZE|INTEGRATED_BUTTONS' also looks nice if
-- you want to keep the window controls visible and integrate
-- them into the tab bar.
config.window_decorations = 'RESIZE|INTEGRATED_BUTTONS'
-- config.integrated_title_button_style = 'Gnome'
-- Sets the font for the window frame (tab bar)
config.window_frame = {
  -- Berkeley Mono for me again, though an idea could be to try a
  -- serif font here instead of monospace for a nicer look?
  font = wezterm.font({ family = 'Hurmit Nerd Font', weight = 'Bold' }),
  font_size = 12,
}

config.keys = {
  {
    key = 't',
    mods = 'CMD',
    action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' },
  },
  {
    key = 't',
    mods = 'CMD|SHIFT',
    action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' },
  },
  {
    key = 'Enter',
    mods = 'CMD|SHIFT',
    action = wezterm.action.TogglePaneZoomState,
  },
  {
    key = 'LeftArrow',
    mods = 'CMD|SHIFT',
    action = wezterm.action.ActivatePaneDirection('Left'),
  },
  {
    key = 'RightArrow',
    mods = 'CMD|SHIFT',
    action = wezterm.action.ActivatePaneDirection('Right'),
  },
  {
    key = 'UpArrow',
    mods = 'CMD|SHIFT',
    action = wezterm.action.ActivatePaneDirection('Up'),
  },
  {
    key = 'DownArrow',
    mods = 'CMD|SHIFT',
    action = wezterm.action.ActivatePaneDirection('Down'),
  },
  {
    key = 'k',
    mods = 'CMD',
    action = wezterm.action.Multiple {
      wezterm.action.ClearScrollback 'ScrollbackAndViewport',
      wezterm.action.SendKey { key = 'L', mods = 'CTRL' },
    }
  },
  {
    key = '/',
    mods = 'CTRL',
    -- This sends the escape sequence Helix expects for Ctrl+/
    action = wezterm.action.SendKey { key = '/', mods = 'CTRL' },
  },
}

-- Returns our config to be evaluated. We must always do this at the bottom of this file
return config
