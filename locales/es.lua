local Translations = {
    error = {
        not_authorized = "No estas autorizado"
    },
    success = {},
    info = {},
    general = {
        locking = "~r~Cerrando..",
        unlocking = "~g~Abriendo..",
        locked = "~r~Cerrada",
        unlocked = "~g~Abierta",
        locked_button = "[~g~E~w~] - Cerrada",
        unlocked_button = "[~g~E~w~] - Abierta"
    }
}

Lang = Locale:new({
    phrases = Translations,
    warnOnMissing = true
})