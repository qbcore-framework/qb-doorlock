local Translations = {
    error = {
        lockpick_fail = "Falhou",
        door_not_found = "Não foi recebido um hash de modelo, se a porta for transparente, certifique-se de mirar na estrutura da porta",
        same_entity = "Ambas as portas não podem ser a mesma entidade",
        door_registered = "Esta porta já está registrada",
        door_identifier_exists = "Já existe uma porta com este identificador na configuração. (%s)",
    },
    success = {
        lockpick_success = "Sucesso"
    },
    general = {
        locked = "Trancada",
        unlocked = "Destrancada",
        locked_button = "[E] - Trancada",
        unlocked_button = "[E] - Destrancada",
        keymapping_description = "Interagir com fechaduras de portas",
        keymapping_remotetriggerdoor = "Ativar remotamente uma porta",
        locked_menu = "Trancada",
        pickable_menu = "Possível de arrombar",
        cantunlock_menu = 'Não pode destrancar',
        hidelabel_menu = 'Ocultar Rótulo da Porta',
        distance_menu = "Distância Máxima",
        item_authorisation_menu = "Autorização de Item",
        citizenid_authorisation_menu = "Autorização de CitizenID",
        gang_authorisation_menu = "Autorização de Gang",
        job_authorisation_menu = "Autorização de Trabalho",
        doortype_title = "Tipo de Porta",
        doortype_door = "Porta Única",
        doortype_double = "Porta Dupla",
        doortype_sliding = "Porta de Correr Única",
        doortype_doublesliding = "Porta de Correr Dupla",
        doortype_garage = "Garagem",
        dooridentifier_title = "Identificador Único",
        doorlabel_title = "Rótulo da Porta",
        configfile_title = "Nome do Arquivo de Configuração",
        submit_text = "Enviar",
        newdoor_menu_title = "Adicionar uma nova porta",
        newdoor_command_description = "Adicionar uma nova porta ao sistema de fechaduras de portas",
        doordebug_command_description = "Alternar modo de depuração",
        warning = "Aviso",
        created_by = "criado por",
        warn_no_permission_newdoor = "%{player} (%{license}) tentou adicionar uma nova porta sem permissão (fonte: %{source})",
        warn_no_authorisation = "%{player} (%{license}) tentou abrir uma porta sem autorização (Enviada: %{doorID})",
        warn_wrong_doorid = "%{player} (%{license}) tentou atualizar uma porta inválida (Enviada: %{doorID})",
        warn_wrong_state = "%{player} (%{license}) tentou atualizar para um estado inválido (Enviado: %{state})",
        warn_wrong_doorid_type = "%{player} (%{license}) não enviou um doorID apropriado (Enviado: %{doorID})",
        warn_admin_privilege_used = "%{player} (%{license}) abriu uma porta usando privilégios de administrador"
    }
}

Lang = Locale:new({
    phrases = Translations,
    warnOnMissing = true
})
