local Translations = {
    error = {
        lockpick_fail = "Fehlgeschlagen",
        door_not_found = "Haben Sie nicht erhalten ein Modell Raute, wenn die Tür transparent ist, stellen Sie sicher, dass Sie auf den Rahmen der Tür Ziel",
        same_entity = "Die beiden Türen können nicht dieselbe Einheit sein",
        door_registered = "Diese Tür ist bereits registriert",
        door_identifier_exists = "Eine Tür mit dieser Kennung existiert bereits in der Konfiguration. (%s)",
    },
    success = {
        lockpick_success = "Erfolgreich"
    },
    general = {
        locked = "Gesperrt",
        unlocked = "Offen",
        locked_button = "[E] - Gesperrt",
        unlocked_button = "[E] - Offen",
        keymapping_description = "Interaktion mit Türschlössern",
        keymapping_remotetriggerdoor = "Fernauslösung einer Tür",
        locked_menu = "Gesperrt",
        pickable_menu = "Lockpicken möglich",
        cantunlock_menu = 'Kann nicht geöffnet werden',
        hidelabel_menu = 'Türschild ausblenden',
        distance_menu = "Maximale Entfernung",
        item_authorisation_menu = "Item Autorisierung",
        citizenid_authorisation_menu = "CitizenID Autorisierung",
        gang_authorisation_menu = "Gang Autorisierung",
        job_authorisation_menu = "Job Autorisierung",
        doortype_title = "Typ der Tür",
        doortype_door = "Einzeltür",
        doortype_double = "Doppeltür",
        doortype_sliding = "Einflügelige Schiebetür",
        doortype_doublesliding = "Doppelte Schiebetür",
        doortype_garage = "Garage",
        dooridentifier_title = "Eindeutiger Identifikator",
        doorlabel_title = "Door Label",
        configfile_title = "Name der Konfig-Datei",
        submit_text = "Bestätigen",
        newdoor_menu_title = "Eine neue Tür hinzufügen",
        newdoor_command_description = "Hinzufügen einer neuen Tür zum Türschließsystem",
        doordebug_command_description = "Umschalten des Debug-Modus",
        warning = "Warnung",
        created_by = "erstellt von",
        warn_no_permission_newdoor = "%{player} (%{license}) versucht hat, ohne Erlaubnis eine neue Tür hinzuzufügen (source: %{source})",
        warn_no_authorisation = "%{player} (%{license}) versucht hat, eine Tür unbefugt zu öffnen (Sent: %{doorID})",
        warn_wrong_doorid = "%{player} (%{license}) versucht, eine ungültige Tür zu aktualisieren (Sent: %{doorID})",
        warn_wrong_state = "%{player} (%{license}) versucht hat, einen ungültigen Zustand zu aktualisieren (Sent: %{state})",
        warn_wrong_doorid_type = "%{player} (%{license}) keine passende doorID gesendet hat (Sent: %{doorID})",
        warn_admin_privilege_used = "%{player} (%{license}) eine Tür mit Admin-Rechten geöffnets"
    }
}

Lang = Locale:new({
    phrases = Translations,
    warnOnMissing = true
})
