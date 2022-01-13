local Translations = {
    error = {
        not_authorized = "Ingen adgang"
    },
    success = {},
    info = {},
    general = {
        locking = "~r~Låser..",
        unlocking = "~g~Låser op..",
        locked = "~r~Låst",
        unlocked = "~g~Ulåst",
        locked_button = "[~g~E~w~] - Låst",
        unlocked_button = "[~g~E~w~] - Ulåst"
    }
}

Lang = Locale:new({
    phrases = Translations,
    warnOnMissing = true
})
