------------------
---- MONITORS ----
------------------

-- See https://wiki.hypr.land/Configuring/Basics/Monitors/
hl.monitor({
    output   = "HDMI-A-1",
    mode     = "1920x1080@120",
    position = "0x0",
    scale    = "1",
    bitdepth = 10,
    cm       = "dcip3"
})
hl.workspace_rule({ workspace = "1",  monitor = "HDMI-A-1", persistent = true})
hl.workspace_rule({ workspace = "2",  monitor = "HDMI-A-1", persistent = true})
hl.workspace_rule({ workspace = "3",  monitor = "HDMI-A-1", persistent = true})
hl.workspace_rule({ workspace = "4",  monitor = "HDMI-A-1", persistent = true})
hl.workspace_rule({ workspace = "5",  monitor = "HDMI-A-1", persistent = true})
