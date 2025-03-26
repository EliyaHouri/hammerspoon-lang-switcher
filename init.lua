local langToSourceID = {
    hebrew = "com.apple.keylayout.Hebrew",
    english = "com.apple.keylayout.US",
    spanish = "com.apple.keylayout.Spanish-ISO"
}

local appWatcher = nil

function switchInputLanguage(appName)
    local script = os.getenv("HOME") .. "/.hammerspoon/lang_switcher.py"
    local command = script .. " '" .. appName .. "'"
    local ok, lang, _ = hs.osascript.applescript(
        'do shell script "' .. command .. '"'
    )

    if ok and lang ~= "" and langToSourceID[lang] then
        hs.keycodes.currentSourceID(langToSourceID[lang])
        hs.alert.show("🌐 " .. lang .. " input activated for " .. appName)
    end
end

appWatcher = hs.application.watcher.new(function(appName, eventType, _)
    if eventType == hs.application.watcher.activated then
        switchInputLanguage(appName)
    end
end)

appWatcher:start()
