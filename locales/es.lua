local Translations = {
    error = {
        lockpick_fail = "Intento de abrir cerradura falló",
        door_not_found = "No recibí el hash del modelo, si la puerta es transparente, asegurate de apuntar al marco de la puerta",
        same_entity = "Ambas puertas no pueden ser la misma entidad",
        door_registered = "Esta puerta ya está registrada",
        door_identifier_exists = "Una puerta con este identificador ya existe en esta configuración. (%{identifier})",
    },
    success = {
        lockpick_success = "Intento de abrir cerradura exitoso"
    },
    general = {
        locked = "Puerta cerrada",
        unlocked = "Puerta abierta",
        locked_button = "[E] - Puerta cerrada",
        unlocked_button = "[E] - Puerta abierta",
        keymapping_description = "Interactúa con la cerradura de la puerta",
        keymapping_remotetriggerdoor = "Activa una puerta remotamente",
        locked_menu = "Cerrada",
        pickable_menu = "Abrible",
        cantunlock_menu = 'No se pude abrir',
        hidelabel_menu = 'Escondar label de puerta',
        distance_menu = "Distancia máxima",
        item_authorisation_menu = "Autorización de objeto",
        citizenid_authorisation_menu = "Autorización de CitizenID",
        gang_authorisation_menu = "Autorización de banda",
        job_authorisation_menu = "Autorización de trabajo",
        doortype_title = "Tipo de puerta",
        doortype_door = "Puerta individual",
        doortype_double = "Doble puerta",
        doortype_sliding = "Puerta deslizable individual",
        doortype_doublesliding = "Doble puerta deslizable",
        doortype_garage = "Garaje",
        dooridentifier_title = "Identificador único",
        doorlabel_title = "Label de puerta",
        configfile_title = "Nombre de archivo de configuración",
        submit_text = "Enviar",
        newdoor_menu_title = "Agregar una nueva puerta",
        newdoor_command_description = "Agregar una nueva puerta al sistema de cierre de puertas",
        doordebug_command_description = "Activar menu de debug",
        warning = "Advertencia",
        created_by = "creado por",
        warn_no_permission_newdoor = "%{player} (%{license}) intentó agregar una puerta sin permiso (fuente: %{source})",
        warn_no_authorisation = "%{player} (%{license}) intentó abrir una puerta sin autorización (Enviado: %{doorID})",
        warn_wrong_doorid = "%{player} (%{license}) intentó actualizar una puerta inválida (Enviado: %{doorID})",
        warn_wrong_state = "%{player} (%{license}) intentó actualizar un estado inválido (Enviado: %{state})",
        warn_wrong_doorid_type = "%{player} (%{license}) no envío la ID de puerta apropiada (Enviado: %{doorID})",
        warn_admin_privilege_used = "%{player} (%{license}) abrió una puerta usando privilegios de admin"
    }
}

Lang = Locale:new({
    phrases = Translations,
    warnOnMissing = true
})