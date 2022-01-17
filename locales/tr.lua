local Translations = {
    error = {
        not_authorized = "Yetkili değil"
    },
    success = {},
    info = {},
    general = {
        locking = "~r~Kilitleniyor..",
        unlocking = "~g~Açılıyor..",
        locked = "~r~Kilitli",
        unlocked = "~g~Açık",
        locked_button = "[~g~E~w~] - Kilitli",
        unlocked_button = "[~g~E~w~] - Açık"
    }
}

Lang = Locale:new({
    phrases = Translations,
    warnOnMissing = true
})
