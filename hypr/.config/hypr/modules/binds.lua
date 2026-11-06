---------------------
---- MY PROGRAMS ----
---------------------

-- Set programs that you use
local home        = os.getenv("HOME")
local terminal    = "kitty"
local fileManager = "thunar"
local menu        = home .. "/.config/rofi/launchers/type-4/launcher.sh"
local browser     = "firefox"
local code        = "vscodium"
local notifs      = "swaync-client -t -sw"
local chat        = "discord"
local monitor     = "kitty --hold btop"
local colorpicker = "hyprpicker -a"
local lockscreen  = "hyprlock"
local clipboard   = "bash " .. home .. "/.config/rofi/scripts/clipboard.sh"
local recordussy  = "bash ~/.config/hypr/scripts/record.sh"
local emojipicker = "bash ~/.config/rofi/scripts/toggle-emoji.sh"
local music       = "spotify-launcher"
local calc        = "bash ~/.config/rofi/scripts/run_calc.sh"

---------------------
---- KEYBINDINGS ----
---------------------

local mainMod     = "SUPER" -- Sets "Windows" key as main modifier

-- Example binds, see https://wiki.hypr.land/Configuring/Basics/Binds/ for more
hl.bind(mainMod .. " + Return", hl.dsp.exec_cmd(terminal))
local closeWindowBind = hl.bind(mainMod .. " + Q", hl.dsp.window.close())
-- closeWindowBind:set_enabled(false)
hl.bind(mainMod .. " + ALT + C", hl.dsp.exec_cmd(colorpicker))
hl.bind(mainMod .. " + End", hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'"))
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + ALT + Space", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + Z", hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. " + R", hl.dsp.exec_cmd(home .. "/.config/waybar/scripts/launch.sh"))
hl.bind(mainMod .. " + W", hl.dsp.exec_cmd(browser))
hl.bind(mainMod .. " + P", hl.dsp.window.pseudo())
hl.bind(mainMod .. " + J", hl.dsp.layout("togglesplit")) -- dwindle only
hl.bind(mainMod .. " + C", hl.dsp.exec_cmd(code))
hl.bind(mainMod .. " + N", hl.dsp.exec_cmd(notifs))
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen())
hl.bind(mainMod .. " + D", hl.dsp.exec_cmd(chat))
hl.bind(mainMod .. " + SHIFT + Escape", hl.dsp.exec_cmd(monitor))
hl.bind(mainMod .. " + SHIFT + L", hl.dsp.exec_cmd(lockscreen))
hl.bind(mainMod .. " + M", hl.dsp.exec_cmd(music))
hl.bind(mainMod .. " + SHIFT + C", hl.dsp.exec_cmd(calc))

--pavu control
hl.bind("CTRL + ALT + V", hl.dsp.exec_cmd("bash ~/.config/hypr/scripts/toggle-pavu.sh"))

-- Waypaper Section (Sequential Cycle)
hl.bind("SUPER + SHIFT + W", hl.dsp.exec_cmd("python3 ~/.config/hypr/scripts/cycle_wallpapers.py"))

--cliboard bind
hl.bind(mainMod .. " + V", hl.dsp.exec_cmd(clipboard))

--record
hl.bind(mainMod .. " + ALT + R", hl.dsp.exec_cmd(recordussy))

--emoji picker
hl.bind(mainMod .. " + SLASH", hl.dsp.exec_cmd(emojipicker))

--Move focus with mainMod + arrow keys
hl.bind(mainMod .. " + left", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down", hl.dsp.focus({ direction = "down" }))
-- Move the current focused window to next/ previous workspaces

hl.bind(mainMod .. " + CTRL + SHIFT + RIGHT", hl.dsp.window.move({ workspace = "+1" }))
hl.bind(mainMod .. " + CTRL + SHIFT + LEFT", hl.dsp.window.move({ workspace = "-1" }))
-- Switch workspaces with mainMod + [0-9]
-- Move active window to a workspace with mainMod + SHIFT + [0-9]
for i = 1, 10 do
    local key = i % 10 -- 10 maps to key 0
    hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
    hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

-- Scroll through existing workspaces with mainMod + scroll
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))


-- Switch workspaces with Super + Ctrl + Arrow
hl.bind(mainMod .. " + CTRL + RIGHT",
    hl.dsp.focus({ workspace = "e+1" })
)

hl.bind(mainMod .. " + CTRL + LEFT",
    hl.dsp.focus({ workspace = "e-1" })
)
-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Laptop multimedia keys for volume and LCD brightness
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"),
    { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),
    { locked = true, repeating = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),
    { locked = true, repeating = true })
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),
    { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"), { locked = true, repeating = true })

-- Requires playerctl
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })


-- Ensure the screenshot directory exists
os.execute("mkdir -p ~/Pictures/Screenshots")

-- Area screenshot with preview/editor
hl.bind(mainMod .. " + SHIFT + S",
    hl.dsp.exec_cmd(
        "grim -g \"$(slurp)\" - | swappy -f - -o - > ~/Pictures/Screenshots/scr_$(date +%Y%m%d_%H%M%S).png"
    )
)

-- Fullscreen screenshot with preview/editor
hl.bind("PRINT",
    hl.dsp.exec_cmd(
        "grim - | swappy -f - -o - > ~/Pictures/Screenshots/scr_$(date +%Y%m%d_%H%M%S).png"
    )
)

--special workspaces

-- Main scratchpad
hl.bind(mainMod .. " + S",         hl.dsp.workspace.toggle_special("magic"))



-- F1-F8 special workspace/s
hl.bind(mainMod .. " + D", hl.dsp.workspace.toggle_special("chat"))
hl.bind(mainMod .. " + F1", hl.dsp.workspace.toggle_special("chat"))
hl.bind(mainMod .. " + F2", hl.dsp.workspace.toggle_special("music"))
hl.bind(mainMod .. " + M", hl.dsp.workspace.toggle_special("music"))
hl.bind(mainMod .. " + F3", hl.dsp.workspace.toggle_special("files"))
hl.bind(mainMod .. " + F4", hl.dsp.workspace.toggle_special("term"))
hl.bind(mainMod .. " + F5", hl.dsp.workspace.toggle_special("notes"))
hl.bind(mainMod .." + SHIFT + Escape", hl.dsp.workspace.toggle_special("monitor"))
hl.bind(mainMod .. " + F7", hl.dsp.workspace.toggle_special("float"))
hl.bind(mainMod .. " + F8", hl.dsp.workspace.toggle_special("misc"))

--Move current window to special workspace/s
hl.bind(mainMod .. " + SHIFT + D",hl.dsp.window.move({ workspace = "special:chat" }))
hl.bind(mainMod .. " + SHIFT + F2", hl.dsp.window.move({ workspace = "special:music" }))
hl.bind(mainMod .. " + SHIFT + F3", hl.dsp.window.move({ workspace = "special:files" }))
hl.bind(mainMod .. " + SHIFT + F4", hl.dsp.window.move({ workspace = "special:term" }))
hl.bind(mainMod .. " + SHIFT + F5", hl.dsp.window.move({ workspace = "special:notes" }))
hl.bind(mainMod .. " + SHIFT + F7", hl.dsp.window.move({ workspace = "special:float" }))
hl.bind(mainMod .. " + SHIFT + F8", hl.dsp.window.move({ workspace = "special:misc" }))


-- External monitor brightness (ddcutil)
local scriptDir = os.getenv("HOME") .. "/.config/hypr/scripts/"

-- Turn dial clockwise while holding SUPER to increase brightness
hl.bind(mainMod .. " + XF86AudioRaiseVolume", function()
    hl.exec_cmd(scriptDir .. "brightness_up.sh")
end, { repeating = true })

-- Turn dial counter-clockwise while holding SUPER to decrease brightness
hl.bind(mainMod .. " + XF86AudioLowerVolume", function()
    hl.exec_cmd(scriptDir .. "brightness_down.sh")
end, { repeating = true })
