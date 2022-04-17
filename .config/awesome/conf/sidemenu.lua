local dpi = beautiful.xresources.apply_dpi

local function box(w)
    return {
        {    
            {
                w,
                widget = wibox.container.margin,
                left = 6,
                right = 6,
                top = 6,
                bottom = 6,
            },
            widget = wibox.container.background,
            shape = gears.shape.rounded_rect,
            bg = beautiful.accent,
        },
        widget = wibox.container.margin,
        margins = 4
    }
end

local function command(c,t)
    return awful.widget.watch(c,t,function(widget,stdout)
        widget:set_text(stdout:sub(1,-2))
    end)
end

--[[ local function volume_widget()
    local volume = tonumber(io.popen("pamixer --get-volume"):read("*a"))
    local widget = wibox.widget {
        box({
            id = 'volume',
            widget = wibox.widget.textbox,
            text = "Volume: " .. string.format("%03d",volume),
        }),
        box({
            id = 'slider',
            widget = wibox.widget.slider,
            bar_height = 4,
            minimum = 0,
            maximum = 100,
            handle_width = 20,
            value = volume,
            forced_height = 20,
        }),
        layout = wibox.layout.align.horizontal,
    }
    widget:get_children_by_id('slider')[1]:connect_signal("widget::redraw_needed",function(w)
        awful.spawn("pamixer --set-volume " .. w.value)
        widget:get_children_by_id('volume')[1].text = "Volume: " .. string.format("%03d",w.value)
    end)
    return widget
end ]]--

local function sidemenu(s)
    menu = wibox {
        x = s.geometry.x,
        y = s.geometry.y + 42,
        width = 500,
        height = s.geometry.height - 50,
        visible = false,
        ontop = true,
        bg = beautiful.bg_normal,
        shape = function(cr,w,h) 
            gears.shape.partially_rounded_rect(cr,w,h,false,true,true,false)
        end
    }
    menu : setup {
        {
            layout = wibox.layout.fixed.vertical,
            box(awful.widget.textclock("%A %B | %T %F | %::z")),
            {
                name = "dick",
                box(command("/bin/sh -c ~/scripts/covid-data",1800)),
                box(command("/bin/sh -c ~/scripts/weather-extra", 1800)),
                layout = wibox.layout.flex.horizontal,
            },
            box(command("/bin/sh -c 'echo \"Uptime: $(~/scripts/uptime-clean)\"'", 1)),
            --volume_widget(),
        },
        widget = wibox.container.margin,
        margins = 6,
    }
    return menu
end

return sidemenu
