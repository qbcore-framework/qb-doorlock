local Translations = {
    error = {
        not_authorized = "Pas autorisé"
    },
    success = {},
    info = {},
    general = {
        locking = "~r~verrouillage..",
        unlocking = "~g~déverrouillage..",
        locked = "~r~verrouillé",
        unlocked = "~g~déverrouillé",
        locked_button = "[~g~E~w~] - verrouillé",
        unlocked_button = "[~g~E~w~] - verrouillé"
    }
}

Lang = Locale:new({
    phrases = Translations,
    warnOnMissing = true
}) 
