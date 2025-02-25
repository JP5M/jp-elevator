local config = require('config')

if #config.elevators == 0 then return end

local function parseVector(value)
    if type(value) == "string" then
        local x, y, z, w = value:match("vector4%(([^,]+), ([^,]+), ([^,]+), ([^)]+)%)")
        if x then
            return vector4(tonumber(x), tonumber(y), tonumber(z), tonumber(w))
        end
        x, y, z = value:match("vector3%(([^,]+), ([^,]+), ([^)]+)%)")
        if x then
            return vector3(tonumber(x), tonumber(y), tonumber(z))
        end
    end
    return value
end

local function notifyOOC(floor)

    if floor.label == "Dach" then
        lib.notify({
            title = 'OOC Bereich',
            description = 'Du hast den OOC-Bereich betreten!',
            type = 'inform'
        })
    elseif floor.label == "Eingang" then
        lib.notify({
            title = 'OOC Bereich',
            description = 'Du hast den OOC-Bereich verlassen!',
            type = 'inform'
        })
    else
        print("Ich weiß nicht ob verlassen oder betreten?")
    end
end

local function openElevatorMenu(elevator)
    local options = {}

    for _, floor in ipairs(elevator.floors) do
        if elevator.id == "ooc_building" then
            table.insert(options, {
                title = floor.label,
                description = floor.description or "",
                event = "jp_elevator:teleport",
                args = {coords = parseVector(floor.coords), floor = floor}
            })
        else
            table.insert(options, {
                title = floor.label,
                description = floor.description or "",
                event = "jp_elevator:teleport",
                args = {coords = parseVector(floor.coords)}
            })
        end
    end

    lib.registerContext({
        id = 'elevator_menu',
        title = elevator.name,
        options = options
    })

    lib.showContext('elevator_menu')
end

RegisterNetEvent('jp_elevator:teleport', function(args)
    local parsedCoords = parseVector(args.coords)
    local coordZ = parsedCoords.z
    
    local isSafe, z = GetGroundZFor_3dCoord(parsedCoords.x, parsedCoords.y, parsedCoords.z, false)
    if isSafe then coordZ = z end
    if config.screenFade then
        DoScreenFadeOut(config.fadeDuration)
        Citizen.Wait(config.fadeDuration)
        SetEntityCoords(cache.ped, parsedCoords.x, parsedCoords.y, coordZ, true, false, false, false)
        DoScreenFadeIn(config.fadeDuration)
    else
    SetEntityCoords(cache.ped, parsedCoords.x, parsedCoords.y, coordZ, true, false, false, false)
    end
    if type(parsedCoords) == 'vector4' then
        SetEntityHeading(cache.ped, parsedCoords.w)
    end
    if args.floor then
        notifyOOC(args.floor)
    end
end)

CreateThread(function()
    for _, elevator in ipairs(config.elevators) do
        for _, floor in ipairs(elevator.floors) do
            local interactionCoords = parseVector(floor.interaction) or parseVector(floor.coords)

            if not interactionCoords then
                print("^1[ERROR] Interaction coordinates missing for:", floor.label)
            else
                if config.interact == "ox_target" then
                    exports.ox_target:addBoxZone({
                        coords = interactionCoords,
                        size = vec3(1.5, 1.5, 1.5),
                        rotation = 0,
                        debug = false,
                        options = {
                            {
                                name = 'use_elevator',
                                icon = 'fa-solid fa-building',
                                label = 'Aufzug benutzen',
                                onSelect = function()
                                    openElevatorMenu(elevator)
                                end,
                                distance = 3.0
                            }
                        }
                    })
                elseif config.interact == "sleepless_interact" then
                    exports.sleepless_interact:addCoords({
                        id = "jp-elevator:interact:"..elevator.id.._,
                        coords = interactionCoords,
                        onEnter = function(data) end,
                        onExit = function(data) end,
                        nearby = function(data) end,
                        options = {
                            {
                                label = "Aufzug benutzen",
                                icon = "fa-solid fa-building",  -- Example simple FA icon name
                                onSelect = function(data) openElevatorMenu(elevator) end
                            }
                        },
                        renderDistance = 5.0,
                        activeDistance = 2.0,
                        cooldown = 1500
                    })
                end
            end
        end
    end
end)
