--------------------------------
---- WINDOWS AND WORKSPACES ----
--------------------------------

-- See https://wiki.hypr.land/Configuring/Basics/Window-Rules/
-- and https://wiki.hypr.land/Configuring/Basics/Workspace-Rules/

-- Example window rules that are useful
local terminal = "kitty"
hl.window_rule({
    -- Ignore maximize requests from all apps. You'll probably like this.
    name  = "suppress-maximize-events",
    match = { class = ".*" },

    suppress_event = "maximize",
})

hl.window_rule({
    -- Fix some dragging issues with XWayland
    name  = "fix-xwayland-drags",
    match = {
        class      = "^$",
        title      = "^$",
        xwayland   = true,
        float      = true,
        fullscreen = false,
        pin        = false,
    },

    no_focus = true,
})

hl.layer_rule({
    name = "rofi-dropdown",
    match = {namespace = "rofi"},
    animation = "slide bottom",
    dim_around = false
})

hl.layer_rule({
    name = "notification",
    match = {namespace = "swaync-control-center"},
    animation = "slide right",
})


hl.window_rule({
    match = { class = "discord" },
    workspace = "special:chat"
})

hl.window_rule({
    match = { class = "spotify" },
    workspace = "special:music"
})

hl.window_rule({
    match = { class = "net.nokyan.Resources" },
    workspace = "special:monitor"
})

hl.window_rule({
    name = "pavucontrol-float",
    match = {class = "org.pulseaudio.pavucontrol"},
    float = true,
    animation = "slide bottom"
})

hl.window_rule({
    name = "firefox-pip",
    match = {
        class = "firefox",
        title = "Picture-in-Picture",
    },
    float = true,
    pin = true,
    size = "500 300",
    move = "75% 5%",
    -- Add transparency here (Active Inactive)
    opacity = "1 1", 
})

hl.window_rule({
    name = "hyprland-share-picker-setup",
    match = {
        initial_class = "hyprland-share-picker",
        initial_title = "Select what to share",
    },
    float = true,
    pin = false,
    center = true,
})

-- Discord Stream Popout Rule
hl.window_rule({ 
  name = "discord-pip", 
  match = { 
    class = "discord", 
    initial_title = "Discord Popout" 
  }, 
  float = true, 
  pin = true, 
  size = "500 300", 
  move = "75% 5%", 
  opacity = "1 0.9" 
})