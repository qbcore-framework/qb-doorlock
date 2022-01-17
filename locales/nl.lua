local Translations = {
    error = {
        not_authorized = "Geen toegang",
        lockpick_fail = "Mislukt",
        screwdriverset_not_found = "Je hebt geen gereedschapskist",
        door_not_locked = "De deur is niet vergrendeld",
        door_not_lockpickable = "Deze deur kan niet worden gelockpicked"
    },
    success = {
        lockpick_success = "Success"
    },
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