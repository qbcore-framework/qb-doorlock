local Translations = {
    error = {
        not_authorized = "غير مسموح"
    },
    success = {},
    info = {},
    general = {
        locking = "~r~ﻞﻔﻘﻣ..",
        unlocking = "~g~ﺡﻮﺘﻔﻣ..",
        locked = "~r~ﻞﻔﻘﻣ",
        unlocked = "~g~ﺡﻮﺘﻔﻣ",
        locked_button = "[~g~E~w~] - ﻞﻔﻘﻣ",
        unlocked_button = "[~g~E~w~] - ﺡﻮﺘﻔﻣ"
    }
}

Lang = Locale:new({
    phrases = Translations,
    warnOnMissing = true
})
