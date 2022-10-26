local Translations = {
    error = {
        not_authorized = "Yetkili değil",
        lockpick_fail = "Başarısız",
        screwdriverset_not_found = "Tornavida setiniz yok",
        door_not_locked = "Kapı kilitli değil",
        door_not_lockpickable = "Bu kapı maymuncuklanamaz!"
    },
    success = {
        lockpick_success = "Başarılı"
    },
    general = {
        job_grade_authorization_menu = "Job Grade (Req for Job, Type & Gang)", -- English Must Change to Language
        job_type_authorization_menu = "Job Type Authorization", -- English Must Change to Language
        locking = "~r~Kilitleniyor..",
        unlocking = "~g~Açılıyor..",
        locked = "~r~Kilitli",
        unlocked = "~g~Açık",
        locked_button = "[~g~E~w~] - Kilitli",
        unlocked_button = "[~g~E~w~] - Açık"
    }
}

Lang = Locale:new({
    phrases = Translations,
    warnOnMissing = true
})
