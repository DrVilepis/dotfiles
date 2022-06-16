local theme_assets = require("beautiful.theme_assets")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi

local gfs = require("gears.filesystem")
local themes_path = "/home/drvilepis/.config/awesome/themes/"
local current_theme = "viletheme"

local theme_path = "/home/drvilepis/.config/awesome/themes/"

local theme = {}

theme.font          = "JetBrainsMono Nerd Font Mono 9"

-- Color variables

theme.color1        = "#252221"
theme.color2        = "#302c2b"
theme.color3        = "#3d3837"
theme.color4        = "#413c3a"
theme.color5        = "#d1c6b4"
theme.color6        = "#beae94"

theme.red           = "#fb4934"
theme.orange        = "#fe8919"
theme.yellow        = "#fabd2f"
theme.green         = "#b8bb26"
theme.cyan          = "#7cbfaa"
theme.blue          = "#7984b3"
theme.purple        = "#b788db"
theme.brown         = "#d65d03"

theme.bg_normal     = theme.color1
theme.bg_focus      = theme.color3
theme.bg_urgent     = theme.red
theme.bg_minimize   = "#0c0c0c"
theme.bg_systray    = theme.color3

theme.fg_normal     = theme.color5
theme.fg_focus      = theme.color2
theme.fg_urgent     = theme.color3
theme.fg_minimize   = theme.color5

theme.accent        = theme.color2

theme.wibar_height = 36
theme.wibar_margins = 6
theme.useless_gap   = 4
theme.border_width  = 2
theme.border_normal = theme.color3
theme.border_focus  = theme.color3
theme.border_marked = theme.color3

theme.titlebar_enabled = false
theme.titlebar_bg_normal = theme.color3
theme.titlebar_bg_focus = theme.color4
theme.titlebar_fg_focus = theme.color5
theme.titlebar_fg_normal = theme.color5

theme.tasklist_fg_normal = theme.color5
theme.tasklist_fg_focus  = theme.color5
theme.tasklist_bg_normal = theme.color3
theme.tasklist_bg_focus  = theme.color4
theme.tasklist_bg_urgent = theme.red
theme.tasklist_fg_urgent = "#222222"

theme.taglist_bg_focus = theme.green
theme.taglist_bg_empty = theme.color4
theme.taglist_bg_occupied = theme.blue
theme.taglist_bg_urgent = theme.red

theme.menubar_fg_normal = theme.color5
theme.menubar_bg_normal = theme.color2

theme.slider_bar_width = 4
theme.slider_handle_shape = gears.shape.circle
theme.slider_handle_color = theme.color5
theme.slider_bar_color = theme.color1

theme.fullscreen_hide_border = true

local taglist_square_size = 4

theme.menu_height = 22
theme.menu_width  = 140

-- images
theme.titlebar_close_button_normal = themes_path..current_theme.."/titlebar/close_normal_dark.png"
theme.titlebar_close_button_focus  = themes_path..current_theme.."/titlebar/close_focus_dark.png"

theme.titlebar_minimize_button_normal = themes_path..current_theme.."/titlebar/minimize_normal_dark.png"
theme.titlebar_minimize_button_focus  = themes_path..current_theme.."/titlebar/minimize_focus_dark.png"

theme.titlebar_ontop_button_normal_inactive = themes_path..current_theme.."/titlebar/ontop_normal_inactive_dark.png"
theme.titlebar_ontop_button_focus_inactive  = themes_path..current_theme.."/titlebar/ontop_focus_inactive_dark.png"
theme.titlebar_ontop_button_normal_active = themes_path..current_theme.."/titlebar/ontop_normal_active_dark.png"
theme.titlebar_ontop_button_focus_active  = themes_path..current_theme.."/titlebar/ontop_focus_active_dark.png"

theme.titlebar_sticky_button_normal_inactive = themes_path..current_theme.."/titlebar/sticky_normal_inactive_dark.png"
theme.titlebar_sticky_button_focus_inactive  = themes_path..current_theme.."/titlebar/sticky_focus_inactive_dark.png"
theme.titlebar_sticky_button_normal_active = themes_path..current_theme.."/titlebar/sticky_normal_active_dark.png"
theme.titlebar_sticky_button_focus_active  = themes_path..current_theme.."/titlebar/sticky_focus_active_dark.png"

theme.titlebar_floating_button_normal_inactive = themes_path..current_theme.."/titlebar/floating_normal_inactive_dark.png"
theme.titlebar_floating_button_focus_inactive  = themes_path..current_theme.."/titlebar/floating_focus_inactive_dark.png"
theme.titlebar_floating_button_normal_active = themes_path..current_theme.."/titlebar/floating_normal_active_dark.png"
theme.titlebar_floating_button_focus_active  = themes_path..current_theme.."/titlebar/floating_focus_active_dark.png"

theme.titlebar_maximized_button_normal_inactive = themes_path..current_theme.."/titlebar/maximized_normal_inactive_dark.png"
theme.titlebar_maximized_button_focus_inactive  = themes_path..current_theme.."/titlebar/maximized_focus_inactive_dark.png"
theme.titlebar_maximized_button_normal_active = themes_path..current_theme.."/titlebar/maximized_normal_active_dark.png"
theme.titlebar_maximized_button_focus_active  = themes_path..current_theme.."/titlebar/maximized_focus_active_dark.png"

theme.wallpaper = "/home/drvilepis/wallpapers/haskell.png"
--theme.wallpaper = themes_path..current_theme.."/background.jpg"

theme.layout_fairh = themes_path..current_theme.."/layouts/fairhw_dark.png"
theme.layout_fairv = themes_path..current_theme.."/layouts/fairvw_dark.png"
theme.layout_floating  = themes_path..current_theme.."/layouts/floatingw_dark.png"
theme.layout_magnifier = themes_path..current_theme.."/layouts/magnifierw_dark.png"
theme.layout_max = themes_path..current_theme.."/layouts/maxw_dark.png"
theme.layout_fullscreen = themes_path..current_theme.."/layouts/fullscreenw_dark.png"
theme.layout_tilebottom = themes_path..current_theme.."/layouts/tilebottomw_dark.png"
theme.layout_tileleft   = themes_path..current_theme.."/layouts/tileleftw_dark.png"
theme.layout_tile = themes_path..current_theme.."/layouts/tilew_dark.png"
theme.layout_tiletop = themes_path..current_theme.."/layouts/tiletopw_dark.png"
theme.layout_spiral  = themes_path..current_theme.."/layouts/spiralw_dark.png"
theme.layout_dwindle = themes_path..current_theme.."/layouts/dwindlew_dark.png"
theme.layout_cornernw = themes_path..current_theme.."/layouts/cornernww_dark.png"
theme.layout_cornerne = themes_path..current_theme.."/layouts/cornernew_dark.png"
theme.layout_cornersw = themes_path..current_theme.."/layouts/cornersww_dark.png"
theme.layout_cornerse = themes_path..current_theme.."/layouts/cornersew_dark.png"

-- Generate Awesome icon:
theme.menu_icon = "/home/drvilepis/personal/icons/haskell.png"
-- Define the icon theme for application icons. If not set then the icons
-- from /usr/share/icons and /usr/share/icons/hicolor will be used.
theme.icon_theme = nil

return theme
