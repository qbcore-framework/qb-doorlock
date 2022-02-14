local Translations = {
    error = {
        lockpick_fail = "Failed",
        door_not_found = "Did not receive a model hash, if the door is transparent, make sure you aim at the frame of the door",
        same_entity = "Both doors can't be the same entity",
        door_registered = "This door is already registered"
    },
    success = {
        lockpick_success = "Success"
    },
    general = {
        locked = "Locked",
        unlocked = "Unlocked",
        locked_button = "[E] - Locked",
        unlocked_button = "[E] - Unlocked",
        keymapping_description = "Interact with door locks",
        locked_menu = "Locked",
        pickable_menu = "Lockpickable",
        distance_menu = "Max Distance",
        item_authorisation_menu = "Item Authorsation",
        citizenid_authorisation_menu = "CitizenID Authorisation",
        gang_authorisation_menu = "Gang Authorisation",
        job_authorisation_menu = "Job Authorisation",
        doortype_title = "Door Type",
        doortype_door = "Single Door",
        doortype_double = "Double Door",
        doortype_sliding = "Single Sliding Door",
        doortype_doublesliding = "Double Sliding Door",
        doortype_garage = "Garage",
        doorname_title = "Door Name",
        configfile_title = "Config File Name",
        submit_text = "Submit",
        newdoor_menu_title = "Add a new door",
        newdoor_command_description = "Add a new door to the doorlock system",
        warning = "Warning",
        created_by = "created by",
        warn_no_permission_newdoor = "%{player} (%{license}) tried to add a new door without permission (source: %{source})",
        warn_no_authorisation = "%{player} (%{license}) attempted to open a door without authorisation (Sent: %{doorID})",
        warn_wrong_doorid = "%{player} (%{license}) attempted to update invalid door (Sent: %{doorID})",
        warn_wrong_state = "%{player} (%{license}) attempted to update to an invalid state (Sent: %{state})",
        warn_wrong_doorid_type = "%{player} (%{license}) didn't send an appropriate doorID (Sent: %{doorID})",
        warn_admin_privilege_used = "%{player} (%{license}) opened a door using admin privileges"
    }
}

Lang = Locale:new({
    phrases = Translations,
    warnOnMissing = true
})