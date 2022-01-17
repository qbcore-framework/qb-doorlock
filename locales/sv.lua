local Translations = {
    error = {
        not_authorized = "Du har inte rättighet till detta"
    },
    success = {},
    info = {},
    general = {
        locking = "~r~Låser..",
        unlocking = "~g~Låser upp..",
        locked = "~r~Låst",
        unlocked = "~g~Olåst",
        locked_button = "[~g~E~w~] - Låst",
        unlocked_button = "[~g~E~w~] - Olåst"
    }
}

Lang = Locale:new({
    phrases = Translations,
    warnOnMissing = true
})
