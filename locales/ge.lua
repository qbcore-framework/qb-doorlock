local Translations = {
    error = {
        not_authorized = "არ ხარ ავტორიზირებული"
    },
    success = {},
    info = {},
    general = {
        locking = "~r~იკეთება..",
        unlocking = "~g~იხსნება..",
        locked = "~r~დაკეტილია",
        unlocked = "~g~გაღებულია",
        locked_button = "[~g~E~w~] - დაიკეტა",
        unlocked_button = "[~g~E~w~] - გაიღო"
    }
}

Lang = Locale:new({
    phrases = Translations,
    warnOnMissing = true
})
