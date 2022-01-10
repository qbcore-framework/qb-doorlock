local Translations = {
    error = {
        not_authorized = "Geen toegang"
    },
    success = {},
    info = {},
    general = {
        locking = "~r~Vergrendelen..",
        unlocking = "~g~Ontgrendelen..",
        locked = "~r~Vergrendeld",
        unlocked = "~g~Ontgrendeld",
        locked_button = "[~g~E~w~] - Vergrendeld",
        unlocked_button = "[~g~E~w~] - Ontgrendeld"
    }
}

Lang = Locale:new({
    phrases = Translations,
    warnOnMissing = true
})