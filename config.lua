config = {
    screenFade = true,  -- Set to false to disable the fade in / fade out option
    fadeDuration = 500, -- Set the time it takes for the fade to complete in ms
    interact = "sleepless_interact", -- Set the target system (ox_target or sleepless_interact)

    elevators = {
        {
            name = "Medical Department", -- Header of the ox_lib UI
            id = "medical_department",
            floors = {
                {
                    label = "Achte Etage",
                    description = "Management & Konferenzräume",
                    coords = vector4(-1829.3250, -336.9168, 84.0602, 143.8193),
                    interaction = vector3(-1827.6355, -336.3678, 84.059) 
                },
                {
                    label = "Zweite Etage",
                    description = "Helipad & Büros",
                    coords = vector4(-1835.7006, -339.2256, 58.1577, 142.9318),
                    interaction = vector3(-1834.0868, -338.9583, 58.1577) 
                },
                {
                    label = "Erste Etage",
                    description = "Behandlungsräume",
                    coords = vector4(-1836.7583, -336.9813, 53.7801, 140.1876),
                    interaction = vector3(-1835.0479, -336.8818, 53.7801) 
                },
                {
                    label = "Erdgeschoss", -- The Button lable, in this case the floor name
                    description = "Haupteingang", -- The Button Description, in this case "main entrance"
                    coords = vector4(-1843.4381, -342.1761, 49.4526, 140.3787), -- The coords that the Player will be teleported to
                    interaction = vector3(-1841.7339, -341.6407, 49.4529) -- the coords at which the ox_target interaction will be at
                },
            }
        },
        {
            name = "OOC Building",
            id = "ooc_building",
            floors = {
                {
                    label = "Dach",
                    description = "Hoch über den Wolken",
                    coords = vector4(261.0066, -1005.0707, 61.6350, 162.2192),
                    interaction = vec3(261.33670043945,-1004.6335449219,61.713207244873)
                },
                {
                    label = "Eingang",
                    description = "Haupteingang Legion Square",
                    coords = vector4(254.4322, -1013.0776, 29.2696, 75.4000),
                    interaction = vec3(255.7276763916,-1013.4527587891,29.668151855469)
                },
                
            }
        },
        {
            name = "LSPD",
            id = "lspd_building",
            floors = {
                {
                    label = "2.OG",
                    description = "Detective und Ruheräume",
                    coords = vector4(-589.6208, -434.3166, 45.6355, 269.8917),
                    interaction = vec3(-588.29992675781,-433.26287841797,45.718338012695)
                },
                {
                    label = "1.OG",
                    description = "Diensträume",
                    coords = vector4(-590.3091, -434.1149, 39.6402, 268.3191),
                    interaction = vec3(-588.89813232422,-433.13070678711,39.88049697876)
                },
                {
                    label = "EG",
                    description = "Eingangsbereich",
                    coords = vector4(-590.2322, -434.1217, 35.1796, 269.1012),
                    interaction = vec3(-588.89294433594,-432.96713256836,35.313407897949)
                },
                {
                    label = "Untergeschoss",
                    description = "Zellen, Asservatenkammer, Verhörräume",
                    coords = vector4(-592.8978, -433.8894, 31.1682, 275.1909),
                    interaction = vec3(-591.80511474609,-432.78500366211,31.366357803345)
                },
            }
        }
    }
}

return config
