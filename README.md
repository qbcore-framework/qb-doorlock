# qb-doorlock
Doorlock Script For QB-Core

Example of a configuration:

	{
		objName = 'hei_v_ilev_bk_gate2_pris', -- Door Name
		objCoords  = vector3(261.83, 221.39, 106.41), -- Objective Cords
		textCoords = vector3(261.83, 221.39, 106.41), -- Text for the lock message
		authorizedJobs = { 'police' }, -- Job Access
            authorizedGangs = { 'vagos' }, -- Gangs Access
            authorizedCitizenID = { 'BUI05180' }, -- Citizen ID Access
		objYaw = -110.0, -- Yaw of door
		locking = false, -- True or False
		locked = true, -- True or False | Locked by default
		pickable = false, -- True or False | Can it be pickable?
		distance = 1.5, -- When will it show the text?
		size = 2 -- How big 
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
