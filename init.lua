require("hs.ipc")

local langToSourceID = {
    hebrew = "com.apple.keylayout.Hebrew",
    english = "com.apple.keylayout.ABC"
}

local pythonPath = "/usr/bin/python3"

function switchInputLanguage(appName)
    local scriptPath = os.getenv("HOME") .. "/.hammerspoon/lang_switcher.py"
    local command = scriptPath .. " '" .. appName .. "'"

    local output, success, _, _ = hs.execute(command)

    if success and output then
        output = output:gsub("%s+", "") -- Trim whitespace

        local currentSource = hs.keycodes.currentSourceID()

        if langToSourceID[output] and currentSource ~= langToSourceID[output] then
            hs.keycodes.currentSourceID(langToSourceID[output])
            hs.alert.show("🌐 " .. output .. " input activated for " .. appName)
        else
            print("🟢 Already in the correct language, no switch needed.")
        end
    else
        print("⚠️ No config for this app or command failed.")
    end
end

appWatcher = hs.application.watcher.new(function(appName, eventType, _)
    if eventType == hs.application.watcher.activated then
        switchInputLanguage(appName)
    end
end)

appWatcher:start()
