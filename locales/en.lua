local Translations = {
    error = {
        not_authorized = "Not authorized"
    },
    success = {},
    info = {},
    general = {
        locking = "~r~Locking..",
        unlocking = "~g~Unlocking..",
        locked = "~r~Locked",
        unlocked = "~g~Unlocked",
        locked_button = "[~g~E~w~] - Locked",
        unlocked_button = "[~g~E~w~] - Unlocked"
    }
}

Lang = Locale:new({
    phrases = Translations,
    warnOnMissing = true
})