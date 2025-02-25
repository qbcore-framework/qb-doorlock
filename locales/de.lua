local Translations = {
    error = {
        lockpick_fail = "Fehlgeschlagen",
        door_not_found = "Kein Modell-Hash erhalten. Wenn die Tür durchsichtig ist, achte darauf, den Türrahmen anzuvisieren.",
        same_entity = "Beide Türen können nicht dasselbe Objekt sein.",
        door_registered = "Diese Tür ist bereits registriert.",
        door_identifier_exists = "Eine Tür mit dieser Kennung existiert bereits in der Konfiguration. (%s)",
    },
    success = {
        lockpick_success = "Erfolgreich"
    },
    general = {
        locked = "Verschlossen",
        unlocked = "Offen",
        locked_button = "[E] - Verschlossen",
        unlocked_button = "[E] - Offen",
        keymapping_description = "Mit Türschlössern interagieren",
        keymapping_remotetriggerdoor = "Tür aus der Ferne auslösen",
        locked_menu = "Verschlossen",
        pickable_menu = "Aufschließbar",
        cantunlock_menu = "Kann nicht geöffnet werden",
        hidelabel_menu = "Türbeschriftung ausblenden",
        distance_menu = "Maximale Entfernung",
        item_authorisation_menu = "Gegenstandsberechtigung",
        citizenid_authorisation_menu = "CitizenID Berechtigung",
        gang_authorisation_menu = "Gang-Berechtigung",
        job_authorisation_menu = "Job-Berechtigung",
        jobGrade_authorisation_menu = "Berufsgrad (Fakultativ)",
        gangGrade_authorisation_menu = "Gang-Grad (Fakultativ)",
        doortype_title = "Türtyp",
        doortype_door = "Einzelne Tür",
        doortype_double = "Doppeltür",
        doortype_sliding = "Einzelne Schiebetür",
        doortype_doublesliding = "Doppelte Schiebetür",
        doortype_garage = "Garagentor",
        dooridentifier_title = "Eindeutige Kennung",
        doorlabel_title = "Türbeschriftung",
        configfile_title = "Konfigurationsdateiname",
        submit_text = "Bestätigen",
        newdoor_menu_title = "Neue Tür hinzufügen",
        newdoor_command_description = "Eine neue Tür zum Türschloss-System hinzufügen",
        doordebug_command_description = "Debug-Modus umschalten",
        warning = "Warnung",
        created_by = "erstellt von",
        warn_no_permission_newdoor = "%{player} (%{license}) hat versucht, ohne Berechtigung eine neue Tür hinzuzufügen (Quelle: %{source})",
        warn_no_authorisation = "%{player} (%{license}) hat versucht, eine Tür ohne Berechtigung zu öffnen (Gesendet: %{doorID})",
        warn_wrong_doorid = "%{player} (%{license}) hat versucht, eine ungültige Tür zu aktualisieren (Gesendet: %{doorID})",
        warn_wrong_state = "%{player} (%{license}) hat versucht, einen ungültigen Zustand zu aktualisieren (Gesendet: %{state})",
        warn_wrong_doorid_type = "%{player} (%{license}) hat keine passende Tür-ID gesendet (Gesendet: %{doorID})",
        warn_admin_privilege_used = "%{player} (%{license}) hat eine Tür mit Admin-Rechten geöffnet"
    }
}

if GetConvar('qb_locale', 'en') == 'de' then
    Lang = Locale:new({
        phrases = Translations,
        warnOnMissing = true,
        fallbackLang = Lang,
    })
end