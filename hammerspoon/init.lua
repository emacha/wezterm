
---Quake mode functionality. Toggle show or hide application.
---@param application string The name of the application.
function HideOrShowApp(application)
    local frontApp = hs.application.frontmostApplication()
    if frontApp and frontApp:name() == application then
        frontApp:hide()
    else
        hs.application.launchOrFocus(application)
    end
end

function DoubleTapKey(key, mods, action)
end

OptionPressed = false
LastOptionPress = 0
-- Finish this. Hopefully make it generic.
local optionTap = hs.eventtap.new({ hs.eventtap.event.types.flagsChanged }, function(e)
    local flags = e:getFlags()

    -- Check if option key was just pressed or released
    if flags.alt and not OptionPressed then
        local now = hs.timer.secondsSinceEpoch()
        if (now - LastOptionPress) < 0.3 then
            HideOrShowApp("WezTerm")
        end
        LastOptionPress = now
        OptionPressed = true
    elseif not flags.alt then
        OptionPressed = false
    end

    return false
end)

optionTap:start()
