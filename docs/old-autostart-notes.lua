hl.on("hyprland.start", function ()
    -- Waybar
    hl.exec_cmd("~/.config/waybar/scripts/launch.sh")

    -- Plugins
    hl.exec_cmd("hyprpm reload")

    -- Wallpaper
    hl.exec_cmd("swww-daemon")

    -- Auto-mount devices
    hl.exec_cmd("udiskie")

    -- Idle daemon
    hl.exec_cmd("hypridle")

    -- Notification daemon
    hl.exec_cmd("swaync")

    -- Cursor
    hl.exec_cmd("hyprctl setcursor macOS 24")

    -- Clipboard
    hl.exec_cmd("wl-paste --type text --watch cliphist store")

    -- Clipboard persist
    hl.exec_cmd("wl-clip-persist --clipboard both")

    -- mpris-proxy
    hl.exec_cmd("mpris-proxy")
end)
