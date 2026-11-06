hl.on("hyprland.start", function ()
    -- 1. D-Bus / systemd environment
    hl.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP=Hyprland")
    hl.exec_cmd("systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")

    -- 2. Restart the portals cleanly (fixes screen sharing, e.g. in Vesktop/Discord)
    hl.exec_cmd("sh -c 'killall -9 xdg-desktop-portal xdg-desktop-portal-hyprland; sleep 1; /usr/lib/xdg-desktop-portal-hyprland & sleep 2; /usr/lib/xdg-desktop-portal &'")

    -- 3. Bar and notifications
    hl.exec_cmd("waybar")
    hl.exec_cmd("swaync")

    -- 4. Authentication and keyring (polkit and KWallet)
    hl.exec_cmd("/usr/lib/polkit-kde-authentication-agent-1")
    hl.exec_cmd("/usr/lib/pam_kwallet_init")

    -- 5. Daemons and hardware control
    hl.exec_cmd("hypridle")
    hl.exec_cmd("openrgb --profile off")

    -- 6. Wallpaper
    hl.exec_cmd("waypaper --restore")

    -- 7. Apps
    hl.exec_cmd("steam -silent")
    hl.exec_cmd("easyeffects --gapplication-service")

    -- 8. Clipboard history
    hl.exec_cmd("sh -c 'wl-paste --type text --watch cliphist store &'")
    hl.exec_cmd("sh -c 'wl-paste --type image --watch cliphist store &'")
end)
