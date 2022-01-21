local Translations = {
    error = {
        not_authorized = "Pas autorisé",
        lockpick_fail = "Échoué",
        screwdriverset_not_found = "Vous n'avez pas de kit de tournevis",
        door_not_locked = "La porte n'est pas vérouillée",
        door_not_lockpickable = "Cette porte ne peut pas être crochetée"
    },
    success = {
        lockpick_success = "succès"    },
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
