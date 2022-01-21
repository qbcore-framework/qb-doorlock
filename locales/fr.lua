local Translations = {
    error = {
        not_authorized = "Pas autorisé",
        lockpick_fail = "Échoué",
        screwdriverset_not_found = "Vous n'avez pas de kit de tournevis",
        door_not_locked = "La porte n'est pas vérouillée",
        door_not_lockpickable = "Cette porte ne peut pas être crochetée"
    },
    success = {
        lockpick_success = "Succès"    
    },
    general = {
        locking = "~r~Verrouillage..",
        unlocking = "~g~Déverrouillage..",
        locked = "~r~Verrouillé",
        unlocked = "~g~Déverrouillé",
        locked_button = "[~g~E~w~] - Verrouillé",
        unlocked_button = "[~g~E~w~] - Verrouillé"
    }
}

Lang = Locale:new({
    phrases = Translations,
    warnOnMissing = true
}) 
