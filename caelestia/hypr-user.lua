local vars = require("variables")
-- ---------------
-- MONITORS
-- ---------------

-- To make them have the proper refresh rate
hl.monitor({
	output = "DP-1",
	mode = "1920x1080@144.00Hz",
	position = "auto",
	scale = "auto"
})

hl.monitor({
	output = "HDMI-A-1",
	mode = "1980x1080@74.97Hz",
	position = "auto",
	scale = "auto"
})

-- Add rules to workspaces
hl.workspace_rule({ workspace = "1", monitor = "DP-1",     default = true, persistent = true })
hl.workspace_rule({ workspace = "2", monitor = "DP-1",     persistent = true })
hl.workspace_rule({ workspace = "3", monitor = "DP-1",     persistent = true })
hl.workspace_rule({ workspace = "4", monitor = "HDMI-A-1", default = true, persistent = true })
hl.workspace_rule({ workspace = "5", monitor = "HDMI-A-1", persistent = true })
hl.workspace_rule({ workspace = "6", monitor = "HDMI-A-1", persistent = true })

-- So workspaces happen between workspaces
hl.bind(vars.kbNextWs_new, hl.dsp.focus({ workspace = "m+1" }))						-- Focus 
hl.bind(vars.kbPrevWs_new, hl.dsp.focus({ workspace = "m-1" }))
hl.bind(vars.kbMoveWinToWsNext_new, hl.dsp.window.move({ workspace = "m+1", follow = true }))		-- Move inside monitors 
hl.bind(vars.kbMoveWinToWsPrev_new, hl.dsp.window.move({ workspace = "m-1", follow = true }))
hl.bind(vars.kbFocusMonitorNext, hl.dsp.focus({ monitor = "DP-1" }))					-- Move accross monitors
hl.bind(vars.kbFocusMonitorPrev, hl.dsp.focus({ monitor = "HDMI-A-1" }))
hl.bind(vars.kbMoveWinToMonNext, hl.dsp.window.move({ monitor = "DP-1", follow = true }))
hl.bind(vars.kbMoveWinToMonPrev, hl.dsp.window.move({ monitor = "HDMI-A-1", follow = true }))
