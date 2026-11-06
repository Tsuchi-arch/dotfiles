hl.on("hyprland.start", function () 
    -- 1. Essential D-Bus and Direct Portal Initialization
    hl.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP=Hyprland")
    hl.exec_cmd("systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
    
    -- The "Nuclear Option" bypass script automated in Lua:
    hl.exec_cmd("killall -e xdg-desktop-portal-hyprland; killall xdg-desktop-portal")
    hl.exec_cmd("/usr/lib/xdg-desktop-portal-hyprland")
    hl.exec_cmd("/usr/lib/xdg-desktop-portal")

    -- 2. System Bars and Notifications
    hl.exec_cmd("waybar")
    hl.exec_cmd("swaync")

    -- 3. Authentication & Keyring (Polkit & KWallet)
    hl.exec_cmd("/usr/lib/polkit-kde-authentication-agent-1")
    hl.exec_cmd("/usr/lib/pam_kwallet_init")

    -- 4. Daemons & Hardware Control
    hl.exec_cmd("hypridle")
    hl.exec_cmd("openrgb --profile off")

    -- 5. Restore Wallpaper
    hl.exec_cmd("waypaper --restore")

    -- 6. misc. vesktop stuff
    hl.exec_cmd("killall -9 xdg-desktop-portal xdg-desktop-portal-hyprland")

    hl.exec_cmd("/usr/lib/xdg-desktop-portal-hyprland & /usr/lib/xdg-desktop-portal &")

    hl.exec_cmd("dbus-send --print-reply --dest=org.freedesktop.portal.Desktop /org/freedesktop/portal/desktop org.freedesktop.DBus.Properties.Get string:org.freedesktop.portal.ScreenCast string:version")

    hl.exec_cmd("/usr/lib/xdg-desktop-portal -v")

    hl.exec_cmd("steam -silent")

    -- Clipboard
    hl.exec_cmd("sh -c 'wl-paste --type text --watch cliphist store &'")
    hl.exec_cmd("sh -c 'wl-paste --type image --watch cliphist store &'")

    hl.exec_cmd("easyeffects --gapplication-service")


end)























