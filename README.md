# qb-doorlock
Doorlock Script For QB-Core

Example of a configuration:

      {
            objName = 'hei_v_ilev_bk_gate2_pris', -- Door name
            objCoords  = vector3(261.83, 221.39, 106.41), -- Object coords
            textCoords = vector3(261.83, 221.39, 106.41), -- Coords for the interaction text
            authorizedJobs = { ['police'] = 0 }, -- Job access (checks for a minimum grade of 0)
            authorizedGangs = { ['vagos'] = 0 }, -- Gang access (checks for a minimum grade of 0)
            authorizedCitizenID = { ['BUI05180'] = true }, -- Citizen ID access
            allAuthorized = false -- true or false | will give access to everyone if it is true
            objYaw = -110.0, -- Yaw of door
            locking = false, -- Leave this at false
            locked = true, -- true or false | Locked by default
            pickable = false, -- true or false | Can it be lockpicked?
            distance = 1.5, -- At what range will it show the interaction text?
      },

# License

    QBCore Framework
    Copyright (C) 2021 Joshua Eger

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <https://www.gnu.org/licenses/>