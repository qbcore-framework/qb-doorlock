local Translations = {
    error = {
        not_authorized = "Neautorizováno"
    },
    success = {},
    info = {},
    general = {
        locking = "~r~Zamykání..",
        unlocking = "~g~Odemykání..",
        locked = "~r~Zamknuto",
        unlocked = "~g~Odemknuto",
        locked_button = "[~g~E~w~] - Zamknout",
        unlocked_button = "[~g~E~w~] - Odemknout"
    }
}

Lang = Locale:new({
    phrases = Translations,
    warnOnMissing = true
})
