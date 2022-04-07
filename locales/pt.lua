local Translations = {
    error = {
        lockpick_fail = "Erro",
        door_not_found = "Hash da porta não recebido! Se a porta for transparente, mira na moldura da porta",
        same_entity = "Ambas as portas não podem ser a mesma entidade",
        door_registered = "Esta porta já existe",
    },
    success = {
        lockpick_success = "Sucesso"
    },
    general = {
        locked = "Trancado",
        unlocked = "Destrancado",
        locked_button = "[E] - Trancado",
        unlocked_button = "[E] - Destrancado",
        keymapping_description = "Interagir com as trancas das portas",
        locked_menu = "Trancado",
        pickable_menu = "Lockpick",
        distance_menu = "Distância Máxima",
        item_authorisation_menu = "Item Autorizado",
        citizenid_authorisation_menu = "CitizenID Autorizado",
        gang_authorisation_menu = "Gang Autorizada",
        job_authorisation_menu = "Trabalho Autorizado",
        doortype_title = "Tipo De Porta",
        doortype_door = "Porta Individual",
        doortype_double = "Porta Dupla",
        doortype_sliding = "Porta Deslizante Individual",
        doortype_doublesliding = "Porta Deslizante Dupla",
        doortype_garage = "Garagem",
        doorname_title = "Nome Da Porta",
        configfile_title = "Nome Ficheiro Config",
        submit_text = "Criar",
        newdoor_menu_title = "Adicionar nova porta",
        newdoor_command_description = "Criar uma nova porta",
        warning = "Aviso",
        created_by = "criado por",
        warn_no_permission_newdoor = "%{player} (%{license}) tentou criar uma nova porta sem permissão (Source: %{source})",
        warn_no_authorisation = "%{player} (%{license}) tentou abrir uma porta sem autorização (Enviado: %{doorID})",
        warn_wrong_doorid = "%{player} (%{license}) tentou atualizar uma porta inválida (Enviado: %{doorID})",
        warn_wrong_state = "%{player} (%{license}) tentou atualizar para um estado inválido (Enviado: %{state})",
        warn_wrong_doorid_type = "%{player} (%{license}) não enviou um ID de porta apropriado (Enviado: %{doorID})",
        warn_admin_privilege_used = "%{player} (%{license}) abriu uma porta com privilégios de admin"
    }
}

Lang = Locale:new({
    phrases = Translations,
    warnOnMissing = true
})
