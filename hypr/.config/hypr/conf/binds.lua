-- https://wiki.hypr.land/Configuring/Basics/Binds/
local mainMod = "SUPER"

-- Basic binds
hl.bind(mainMod .. " + return",     hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + F",          hl.dsp.window.fullscreen())
hl.bind(mainMod .. " + Q",          hl.dsp.window.close())
hl.bind(mainMod .. " + M",          hl.dsp.exit())
hl.bind(mainMod .. " + V",          hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + SHIFT + E",  hl.dsp.workspace.toggle_special("email"))
hl.bind(mainMod .. " + space",      hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. " + P",          hl.dsp.window.pseudo())
hl.bind(mainMod .. " + J",          hl.dsp.layout("togglesplit"))
hl.bind(mainMod .. " + B",          hl.dsp.exec_cmd("/home/joonas/.scripts/backups/runbackup"))
hl.bind(mainMod .. " + N",          hl.dsp.exec_cmd("swaync-client -t -sw"))
hl.bind(mainMod .. " + SHIFT + U",  hl.dsp.exec_cmd("hyprctl dispatch focusurgentorlast"))
hl.bind(mainMod .. " + C",          hl.dsp.workspace.toggle_special("yazi"))
hl.bind(mainMod .. " + E",          hl.dsp.workspace.toggle_special("emacs"))
-- NOTE: plugin dispatch - check https://wiki.hypr.land for correct Lua API
hl.bind(mainMod .. " + G",          hl.dsp.exec_cmd("hyprctl dispatch hyprexpo:expo toggle"))
hl.bind(mainMod .. " + H",          hl.dsp.focus({ workspace = "r-1" }))
hl.bind(mainMod .. " + L",          hl.dsp.focus({ workspace = "r+1" }))
hl.bind(mainMod .. " + Z",          hl.dsp.exec_cmd("pypr zoom ++0.5"))
hl.bind(mainMod .. " + SHIFT + Z",  hl.dsp.exec_cmd("pypr zoom"))

-- Shift binds
hl.bind(mainMod .. " + SHIFT + F",      hl.dsp.exec_cmd("emacsclient -c -a emacs"))
-- NOTE: layoutmsg dispatch - may need hl.dsp.layoutmsg() instead, check wiki
hl.bind(mainMod .. " + SHIFT + K",      hl.dsp.layout("mfact +0.05"))
hl.bind(mainMod .. " + SHIFT + J",      hl.dsp.layout("mfact -0.05"))
hl.bind(mainMod .. " + SHIFT + P",      hl.dsp.exec_cmd("/home/joonas/.scripts/zathuraopen"))
hl.bind(mainMod .. " + SHIFT + L",      hl.dsp.exec_cmd("brave --password-store=basic"))
hl.bind(mainMod .. " + SHIFT + M",      hl.dsp.exec_cmd("/home/joonas/.scripts/hyprland/hyprsplain"))
hl.bind(mainMod .. " + SHIFT + G",      hl.dsp.exec_cmd("retroarch"))
hl.bind(mainMod .. " + SHIFT + D",      hl.dsp.workspace.toggle_special("discord"))
hl.bind(mainMod .. " + SHIFT + O",      hl.dsp.workspace.toggle_special("obs"))
hl.bind(mainMod .. " + SHIFT + T",      hl.dsp.exec_cmd("/home/joonas/.scripts/hyprland/darkthemechanger"))
hl.bind(mainMod .. " + SHIFT + I",      hl.dsp.exec_cmd("rofi-pass"))
hl.bind(mainMod .. " + SHIFT + X",      hl.dsp.exec_cmd("hyprlock & /home/joonas/.scripts/whatalbum"))
hl.bind(mainMod .. " + SHIFT + R",      hl.dsp.exec_cmd("/home/joonas/.scripts/hyprland/sshscript"))
hl.bind(mainMod .. " + SHIFT + return", hl.dsp.exec_cmd("pypr toggle term"))

-- Control binds
hl.bind(mainMod .. " + CTRL + 3", hl.dsp.exec_cmd("hyprshot -m window"))
hl.bind(mainMod .. " + CTRL + 4", hl.dsp.exec_cmd("hyprshot -m region"))
hl.bind(mainMod .. " + CTRL + E", hl.dsp.exec_cmd("rofi -show emoji"))
hl.bind(mainMod .. " + CTRL + P", hl.dsp.exec_cmd("zathura"))
hl.bind(mainMod .. " + CTRL + A", hl.dsp.exec_cmd("/home/joonas/.scripts/audioswitcher"))
hl.bind(mainMod .. " + CTRL + V", hl.dsp.exec_cmd("sh -c 'cliphist list | rofi -dmenu | cliphist decode | wl-copy'"))
hl.bind(mainMod .. " + CTRL + R", hl.dsp.exec_cmd("curl -sSL https://radar.weather.gov/ridge/standard/CONUS-LARGE_loop.gif | swayimg -s fit - & notify-send 'CONUS Radar Mosaic loaded'"))
hl.bind(mainMod .. " + CTRL + C", hl.dsp.exec_cmd("pgrep qalculate-gtk && hyprctl dispatch togglespecialworkspace calculator || qalculate-gtk &"))
hl.bind(mainMod .. " + CTRL + D", hl.dsp.exec_cmd("/home/joonas/.scripts/musicdownload"))
hl.bind(mainMod .. " + CTRL + S", hl.dsp.workspace.toggle_special("Spotify"))
hl.bind(mainMod .. " + CTRL + L", hl.dsp.exec_cmd("/home/joonas/.scripts/homeassistant/officelight"))
hl.bind(mainMod .. " + CTRL + T", hl.dsp.exec_cmd("/home/joonas/.scripts/hyprland/lightthemechanger"))
hl.bind(mainMod .. " + CTRL + M", hl.dsp.workspace.toggle_special("ncmp"))

-- Weather submap
-- NOTE: Lua submap API not shown in example - check https://wiki.hypr.land/Configuring/Basics/Binds/
-- Possible API (verify before using):
-- hl.bind(mainMod .. " + CTRL + W", hl.dsp.submap("weather"))
-- hl.submap("weather", function()
--     hl.bind("W",      hl.dsp.exec_cmd("/home/joonas/.scripts/hyprland/radar/hyprradar"))
--     hl.bind("R",      hl.dsp.exec_cmd("curl -sSL https://radar.weather.gov/ridge/standard/CONUS-LARGE_loop.gif | swayimg -s fit - & notify-send 'CONUS Radar Mosaic loaded'"))
--     hl.bind("escape", hl.dsp.submap("reset"))
-- end)

-- Alt binds
hl.bind(mainMod .. " + ALT + T", hl.dsp.exec_cmd('pypr menu "tmux"'))
hl.bind(mainMod .. " + ALT + P", hl.dsp.exec_cmd("brave --app=https://perplexity.ai"))
hl.bind(mainMod .. " + ALT + C", hl.dsp.exec_cmd("zen-browser --app=https://chatgpt.com"))
hl.bind(mainMod .. " + ALT + B", hl.dsp.exec_cmd('pypr menu "banking"'))

-- Focus with arrow keys
hl.bind(mainMod .. " + left",  hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up",    hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down",  hl.dsp.focus({ direction = "down" }))

-- Move windows with direction
hl.bind(mainMod .. " + SHIFT + left",  hl.dsp.window.move({ direction = "l" }))
hl.bind(mainMod .. " + SHIFT + right", hl.dsp.window.move({ direction = "r" }))
hl.bind(mainMod .. " + SHIFT + up",    hl.dsp.window.move({ direction = "u" }))
hl.bind(mainMod .. " + SHIFT + down",  hl.dsp.window.move({ direction = "d" }))

-- Switch workspaces
for i = 1, 9 do
    hl.bind(mainMod .. " + " .. i,             hl.dsp.focus({ workspace = i }))
    hl.bind(mainMod .. " + SHIFT + " .. i,     hl.dsp.window.move({ workspace = i }))
end
hl.bind(mainMod .. " + 0",         hl.dsp.focus({ workspace = 10 }))
hl.bind(mainMod .. " + SHIFT + 0", hl.dsp.window.move({ workspace = 10 }))

-- Alternate workspace keys
hl.bind(mainMod .. " + r", hl.dsp.focus({ workspace = 1 }))
hl.bind(mainMod .. " + t", hl.dsp.focus({ workspace = 2 }))
hl.bind(mainMod .. " + y", hl.dsp.focus({ workspace = 3 }))
hl.bind(mainMod .. " + u", hl.dsp.focus({ workspace = 4 }))
hl.bind(mainMod .. " + i", hl.dsp.focus({ workspace = 5 }))
hl.bind(mainMod .. " + o", hl.dsp.focus({ workspace = 6 }))

-- Special workspaces
hl.bind(mainMod .. " + S",          hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + SHIFT + S",  hl.dsp.window.move({ workspace = "special:magic" }))

-- Scroll through workspaces
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up",   hl.dsp.focus({ workspace = "e-1" }))

-- Mouse drag/resize
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })
hl.bind(mainMod .. " + mouse:276", hl.dsp.exec_cmd("ghostty --gtk-single-instance=true"))
hl.bind(mainMod .. " + mouse:275", hl.dsp.exec_cmd("wezterm"))
hl.bind(mainMod .. " + mouse:274", hl.dsp.exec_cmd("footclient"))

-- Media keys (locked + repeating)
hl.bind("XF86AudioRaiseVolume",  hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume",  hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),      { locked = true, repeating = true })
hl.bind("XF86AudioMute",         hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),     { locked = true, repeating = true })
hl.bind("XF86AudioMicMute",      hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),   { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp",   hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"),                  { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"),                  { locked = true, repeating = true })

-- Media keys (locked)
hl.bind("XF86AudioNext",  hl.dsp.exec_cmd("playerctl next"),       { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay",  hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev",  hl.dsp.exec_cmd("playerctl previous"),   { locked = true })

-- Old/unused binds
-- hl.bind(mainMod .. " + ALT + J", hl.dsp.exec_cmd("mpc next"))
-- hl.bind(mainMod .. " + ALT + K", hl.dsp.exec_cmd("mpc prev"))
-- hl.bind(mainMod .. " + ALT + I", hl.dsp.exec_cmd("mpc toggle"))
-- hl.bind(mainMod .. " + CTRL + J", hl.dsp.exec_cmd("/home/joonas/.scripts/volumecontrol 5%-"))
-- hl.bind(mainMod .. " + CTRL + K", hl.dsp.exec_cmd("/home/joonas/.scripts/volumecontrol 5%+"))
