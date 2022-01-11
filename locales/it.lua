local Translations = {
    error = {
        not_authorized = "Non autorizzato"
    },
    success = {},
    info = {},
    general = {
        locking = "~r~Chiudendo..",
        unlocking = "~g~Aprendo..",
        locked = "~r~Chiuso",
        unlocked = "~g~Aperto",
        locked_button = "[~g~E~w~] - Chiuso",
        unlocked_button = "[~g~E~w~] - Aperto"
    }
}

Lang = Locale:new({
    phrases = Translations,
    warnOnMissing = true
})