local Translations = {
    error = {
        not_authorized = "Não autorizado",
        lockpick_fail = "Falhaste",
        screwdriverset_not_found = "Não tens uma chave de fendas",
        door_not_locked = "A porta não está trancada",
        door_not_lockpickable = "Esta porta não pode ser forçada"
    },
    success = {
        lockpick_success = "Sucesso"
    },
    general = {
        locking = "~r~Fechando..",
        unlocking = "~g~Abrindo..",
        locked = "~r~Fechado",
        unlocked = "~g~Aberto",
        locked_button = "[~g~E~w~] - Fechado",
        unlocked_button = "[~g~E~w~] - Aberto"
    }
}

Lang = Locale:new({
    phrases = Translations,
    warnOnMissing = true
})
