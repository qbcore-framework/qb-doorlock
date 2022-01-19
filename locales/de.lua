local Translations = {
    error = {
        not_authorized = "Nicht autorisiert"
    },
    success = {},
    info = {},
    general = {
        locking = "~r~Schließe ab..",
        unlocking = "~g~Schließe auf..",
        locked = "~r~Abgeschlossen",
        unlocked = "~g~Aufgeschlossen",
        locked_button = "[~g~E~w~] - Abgeschlossen",
        unlocked_button = "[~g~E~w~] - Aufgeschlossen"
    }
}

Lang = Locale:new({
    phrases = Translations,
    warnOnMissing = true
})
