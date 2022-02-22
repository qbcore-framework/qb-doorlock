local Translations = {
    error = {
        not_authorized = "Não autorizado",
        lockpick_fail = "Erro",
        screwdriverset_not_found = "Não tens um kit de chaves",
        door_not_locked = "A porta não está trancada",
        door_not_lockpickable = "Esta porta não pode ser forçada"
    },
    success = {
        lockpick_success = "Sucesso"
    },
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
