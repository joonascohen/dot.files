require("colors")

-- Bezier curves used by hyprfocus
hl.curve("bezIn",  { type = "bezier", points = { {0.5, 0.0}, {1.0, 0.5} } })
hl.curve("bezOut", { type = "bezier", points = { {0.0, 0.5}, {0.5, 1.0} } })

-- Plugin config keys are not supported via hl.config in Lua mode.
-- Plugins are managed by hyprpm; their settings must be configured via
-- plugin-specific Lua APIs (hl.plugin.<name>) if supported, or left at defaults.
