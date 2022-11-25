local Translations = {
    error = {
        lockpick_fail = "Échoué",
        door_not_found = "N'a pas reçu de Hash pour le modèle, Si la porte est transparente assurez vous de pointer au cadre de la porte",
        same_entity = "Les deux portes ne peuvent pas être la même entitée",
        door_registered = "Cette porte est déjà enregistrée",
        door_identifier_exists = "Une porte avec cet identifiant existe déjà dans la config. (%s)"
    },
    success = {
        lockpick_success = "Succès"
    },
    general = {
        locked = "Vérouillé",
        unlocked = "Dévérouillé",
        locked_button = "[E] - Vérouillé",
        unlocked_button = "[E] - Dévérouillé",
        keymapping_description = "Intéragir avec les vérous de portes",
        keymapping_remotetriggerdoor = "Déclencher à distance une porte",
        locked_menu = "Vérouillé",
        pickable_menu = "Crochetable",
        cantunlock_menu = 'Ne peux pas dévérouillé',
        hidelabel_menu = 'Masquer l\'étiquette de la porte',
        distance_menu = "Distance Max",
        item_authorisation_menu = "Autorisation Objet",
        citizenid_authorisation_menu = "Autorisation CitizenID",
        gang_authorisation_menu = "Autorisation Gang",
        job_authorisation_menu = "Autorisation Job",
        doortype_title = "Type de Porte",
        doortype_door = "Porte Simple",
        doortype_double = "Porte Double",
        doortype_sliding = "Porte Simple Glissante",
        doortype_doublesliding = "Porte Double Glissante",
        doortype_garage = "Garage",
        dooridentifier_title = "Identifiant unique",
        doorlabel_title = "Nom de Porte",
        configfile_title = "Nom du fichier Config",
        submit_text = "Soummetre",
        newdoor_menu_title = "Ajouter une nouvelle porte",
        newdoor_command_description = "Ajouter une porte au système Doorlock",
        doordebug_command_description = "Basculer en mode débogage",
        warning = "Attention",
        created_by = "créer par",
        warn_no_permission_newdoor = "%{player} (%{license}) à essayé d'ajouter une porte sans permission (source: %{source})",
        warn_no_authorisation = "%{player} (%{license}) à essayé d'ouvrir une porte sans autorisation (Sent: %{doorID})",
        warn_wrong_doorid = "%{player} (%{license}) à essayé de mettre a jour une porte invalide (Sent: %{doorID})",
        warn_wrong_state = "%{player} (%{license}) à essayé de mettre a jour une porte à un état invalide (Sent: %{state})",
        warn_wrong_doorid_type = "%{player} (%{license}) n'a pas envoyé un ID valide (Sent: %{doorID})",
        warn_admin_privilege_used = "%{player} (%{license}) à ouvert une porte avec les privilèges administrateur"
    }
}

Lang = Locale:new({
    phrases = Translations,
    warnOnMissing = true
})
