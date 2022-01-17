local Translations = {
    error = {
        not_authorized = "Ei avaimia"
    },
    success = {},
    info = {},
    general = {
        locking = "~r~Lukitaan..",
        unlocking = "~g~Avataan..",
        locked = "~r~Lukittu",
        unlocked = "~g~Avattu",
        locked_button = "[~g~E~w~] - Lukittu",
        unlocked_button = "[~g~E~w~] - Avattu"
    }
}

Lang = Locale:new({
    phrases = Translations,
    warnOnMissing = true
})
