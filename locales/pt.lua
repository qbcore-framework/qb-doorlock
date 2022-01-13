local Translations = {
    error = {
        not_authorized = "Não autorizado"
    },
    success = {},
    info = {},
    general = {
        locking = "~r~A trancar..",
        unlocking = "~g~A destrancar..",
        locked = "~r~Trancado",
        unlocked = "~g~Destrancado",
        locked_button = "[~g~E~w~] - Trancado",
        unlocked_button = "[~g~E~w~] - Destrancado"
    }
}

Lang = Locale:new({
    phrases = Translations,
    warnOnMissing = true
})
