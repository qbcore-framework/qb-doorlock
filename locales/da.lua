local Translations = {
    error = {
        lockpick_fail = "Fejlede",
        door_not_found = "Har ikke modtaget en modelhash, hvis døren er gennemsigtig, så sørg for at sigte mod dørens ramme",
        same_entity = "Begge døre kan ikke være den samme enhed",
        door_registered = "Denne dør er allerede registreret",
        door_identifier_exists = "En dør med denne identifikator findes allerede i konfigurationen. (%s)",
    },
    success = {
        lockpick_success = "Succes"
    },
    general = {
        locked = "Låst",
        unlocked = "Ulåst",
        locked_button = "[E] - Låst",
        unlocked_button = "[E] - Ulåst",
        keymapping_description = "Interagere med dørlåse",
        keymapping_remotetriggerdoor = "Fjernudløser en dør",
        locked_menu = "Låst",
        pickable_menu = "Låsevalgbar",
        cantunlock_menu = 'Kan ikke låse op',
        hidelabel_menu = 'Skjul dørlabel',
        distance_menu = "Max afstand",
        item_authorisation_menu = "Vareforfattelse",
        citizenid_authorisation_menu = "Citizen ID Autorisation",
        gang_authorisation_menu = "Gang Authorisation",
        job_authorisation_menu = "Job Authorisation",
        doortype_title = "Dør Type",
        doortype_door = "Enkelt dør",
        doortype_double = "Dobbeltdør",
        doortype_sliding = "Enkel Glide Dør",
        doortype_doublesliding = "Dobbel Glide Dør",
        doortype_garage = "Garage",
        dooridentifier_title = "Unik identifikator",
        doorlabel_title = "Dør mærke",
        configfile_title = "Konfigurationsfilnavn",
        submit_text = "Bekræft",
        newdoor_menu_title = "Tilføj en ny dør",
        newdoor_command_description = "Tilføj en ny dør til doorlock systemet",
        doordebug_command_description = "Skift fejlretningstilstand",
        warning = "Advarsel",
        created_by = "lavet af",
        warn_no_permission_newdoor = "%{player} (%{license}) prøvede at tilføje en ny dør uden permission (source: %{source})",
        warn_no_authorisation = "%{player} (%{license}) prøvede at åbne en dør uden tilladelse (Sent: %{doorID})",
        warn_wrong_doorid = "%{player} (%{license}) prøvede at opdater en ugyildig dør (Sent: %{doorID})",
        warn_wrong_state = "%{player} (%{license}) forsøgte at opdatere til en ugyldig tilstand (Sent: %{state})",
        warn_wrong_doorid_type = "%{player} (%{license}) sendte ikke et passende doorID (Sent: %{doorID})",
        warn_admin_privilege_used = "%{player} (%{license}) åbnede en dør ved hjælp af administratorrettigheder"
    }
}

if GetConvar('qb_locale', 'en') == 'da' then
    Lang = Locale:new({
        phrases = Translations,
        warnOnMissing = true,
        fallbackLang = Lang,
    })
end
