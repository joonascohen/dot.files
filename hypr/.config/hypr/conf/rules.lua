-- https://wiki.hypr.land/Configuring/Basics/Window-Rules/
-- https://wiki.hypr.land/Configuring/Basics/Workspace-Rules/

hl.window_rule({
    match          = { class = ".*" },
    suppress_event = "maximize",
})

-- Floating windows
hl.window_rule({ match = { class = "(yad)" },                  float = true })
hl.window_rule({ match = { class = "^(com%.libretro%.RetroArch)$" }, float = true })
hl.window_rule({ match = { class = "^swayimg_[0-9]+" },        float = true })
hl.window_rule({ match = { class = "^swayimg_[0-9]+", float = true }, center = true })
hl.window_rule({ match = { class = "^(feh)$" },                float = true })
hl.window_rule({ match = { class = "^(feh)$", float = true },  center = true })
hl.window_rule({ match = { class = "(qalculate-gtk)" },        float = true })
hl.window_rule({ match = { class = "(qalculate-gtk)" },        workspace = "special:calculator" })
hl.window_rule({ match = { title = "^(Steram Deck UI)$" },     workspace = "6" })
hl.window_rule({ match = { class = "!^(Brave-browser)$" },     float = true })
hl.window_rule({ match = { title = "^(chatgpt%.com)$" },       float = true })
hl.window_rule({ match = { title = "^(chatgpt%.com)$" },       center = true })

-- Layer rules
hl.layer_rule({
    match     = { namespace = "rofi" },
    blur      = true,
    animation = "popin 85%",
})

-- Special workspaces (on-created-empty)
hl.workspace_rule({ workspace = "special:Spotify", on_created_empty = "kitty --single-instance -e rmpc & kitty --single-instance -e rmpc & ~/.scripts/tmuxmusic" })
hl.workspace_rule({ workspace = "special:email",   on_created_empty = "thunderbird" })
hl.workspace_rule({ workspace = "special:yazi",    on_created_empty = "kitty -e yazi" })
hl.workspace_rule({ workspace = "special:discord", on_created_empty = "discord" })
hl.workspace_rule({ workspace = "special:obs",     on_created_empty = "obs" })
hl.workspace_rule({ workspace = "special:emacs",   on_created_empty = "emacsclient -c" })
hl.workspace_rule({ workspace = "special:ncmp",    on_created_empty = "kitty -e ncmpcpp" })

-- Pyprland scratchpads
hl.window_rule({
    match     = { class = "^(scratchpad)$" },
    float     = true,
    size      = "80% 85%",
    workspace = "special silent",
    center    = true,
})
