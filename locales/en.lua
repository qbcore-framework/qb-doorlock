local Translations = {
    error = {
        not_authorized = "Not authorized",
        lockpick_fail = "Failed",
        screwdriverset_not_found = "You don't have a Screwdriver Set",
        door_not_locked = "The door is not locked",
        door_not_lockpickable = "This door can't be lockpicked"
    },
    success = {
        lockpick_success = "Success"
    },
    general = {
        locking = "~r~Locking..",
        unlocking = "~g~Unlocking..",
        locked = "~r~Locked",
        unlocked = "~g~Unlocked",
        locked_button = "[~g~E~w~] - Locked",
        unlocked_button = "[~g~E~w~] - Unlocked"
    }
}

Lang = Locale:new({
    phrases = Translations,
    warnOnMissing = true
})