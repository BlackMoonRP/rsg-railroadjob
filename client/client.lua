local RSGCore = exports['rsg-core']:GetCoreObject()
local CURRENT_TRAIN = nil
local train = nil
local trainspawned = false
local trainrunning = false

RegisterNetEvent('rsg-railroadjob:client:companyone', function(data)
    local railroadMenu = {{
        header = '| Railroad Menu |',
        isMenuHeader = true
    }}

    for k, v in pairs(Config.CentralTrains) do
        railroadMenu[#railroadMenu + 1] = {
            header = '🚂 | Activate ' .. k,
            txt = v.label,
            params = {
                event = 'rsg-railroadjob:client:spawntrain',
                isServer = false,
                args = {
                    trainHash = v.hash
                }
            }
        }
    end

    railroadMenu[#railroadMenu + 1] = {
        header = 'Close Menu',
        txt = '',
        params = {
            event = 'bm-menu:closeMenu'
        }
    }
    exports['bm-menu']:openMenu(railroadMenu)
end)
RegisterNetEvent('rsg-railroadjob:client:companytwo', function(data)
    local railroadMenu = {{
        header = '| Railroad Menu |',
        isMenuHeader = true
    }}
    for k, v in pairs(Config.SouthernTrains) do
        railroadMenu[#railroadMenu + 1] = {
            header = '🚂 | Activate ' .. k,
            txt = v.label,
            params = {
                event = 'rsg-railroadjob:client:spawntrain',
                isServer = false,
                args = {
                    trainHash = v.hash
                }
            }
        }
    end
    railroadMenu[#railroadMenu + 1] = {
        header = 'Close Menu',
        txt = '',
        params = {
            event = 'bm-menu:closeMenu'
        }
    }
    exports['bm-menu']:openMenu(railroadMenu)
end)
RegisterNetEvent('rsg-railroadjob:client:companythree', function(data)
    local railroadMenu = {{
        header = '| Railroad Menu |',
        isMenuHeader = true
    }}
    for k, v in pairs(Config.OtherTrains) do
        railroadMenu[#railroadMenu + 1] = {
            header = '🚂 | ' .. v.label,
            txt = '',
            params = {
                event = 'rsg-railroadjob:client:spawntrain',
                isServer = false,
                args = {
                    trainHash = v.hash
                }
            }
        }
    end
    railroadMenu[#railroadMenu + 1] = {
        header = 'Close Menu',
        txt = '',
        params = {
            event = 'bm-menu:closeMenu'
        }
    }
    exports['bm-menu']:openMenu(railroadMenu)
end)

RegisterNetEvent('rsg-railroadjob:client:remove', function(data)
    DeleteEntity(CURRENT_TRAIN)

    trainspawned = false
    trainrunning = false
end)

-- railroad menu
RegisterNetEvent('rsg-railroadjob:client:menu', function(data)
    if not trainspawned then
        exports['bm-menu']:openMenu({
            {
                header = '| Railroad Menu |',
                txt = 'Select a Company',
                isMenuHeader = true,
            }, {
                header = '🚂 | Central union Railroad',
                txt = '',
                params = {
                    event = 'rsg-railroadjob:client:companyone',
                    isServer = false,
                }
            }, {
                header = '🚂 | Southern and Eastern Railway',
                txt = '',
                params = {
                    event = 'rsg-railroadjob:client:companytwo',
                    isServer = false,
                }
            }, {
                header = '🚂 | Other Railroad',
                txt = '',
                params = {
                    event = 'rsg-railroadjob:client:companythree',
                    isServer = false,
                }
            }, {
                header = 'Close Menu',
                txt = '',
                params = {
                    event = 'bm-menu:closeMenu',
                }
            },
        })
    else
        exports['bm-menu']:openMenu({
            {
                header = '| Railroad Menu |',
                txt = 'Select a Company',
                isMenuHeader = true,
            }, {
                header = 'Remove Train',
                txt = '',
                params = {
                    event = 'rsg-railroadjob:client:remove',
                    isServer = false,
                }
            }, {
                header = 'Close Menu',
                txt = '',
                params = {
                    event = 'bm-menu:closeMenu',
                }
            },
        })
    end
end)

RegisterNetEvent('rsg-railroadjob:client:spawntrain')
AddEventHandler('rsg-railroadjob:client:spawntrain', function(data)
    -- if RSGCore.Functions.GetPlayerData().job.name == 'railroad' then
        if not trainspawned then
            SetRandomTrains(false)
            --requestmodel--
            local trainWagons = N_0x635423d55ca84fc8(data.trainHash)
            print(trainWagons)
            for wagonIndex = 0, trainWagons - 1 do
                local trainWagonModel = N_0x8df5f6a19f99f0d5(data.trainHash, wagonIndex)
                while not HasModelLoaded(trainWagonModel) do
                    Citizen.InvokeNative(0xFA28FE3A6246FC30, trainWagonModel, 1)
                    Citizen.Wait(100)
                end
            end
            --spawn train--
            --local train = N_0xc239dbd9a57d2a71(data.trainHash, GetEntityCoords(PlayerPedId()), 0, 1, 1, 1)
            local train = N_0xc239dbd9a57d2a71(data.trainHash, vector3(-185.09, 596.99, 113.51), 0, 1, 1, 1)
            SetTrainSpeed(train, 0.0)
            local coords = GetEntityCoords(train)
            local trainV = vector3(coords.x, coords.y, coords.z)
            SetModelAsNoLongerNeeded(train)
            --blip--
            local blipname = 'Train'
            local bliphash = -399496385
            local blip = Citizen.InvokeNative(0x23f74c2fda6e7c61, bliphash, train) -- blip for train
            SetBlipScale(blip, 1.5)
            CURRENT_TRAIN = train
            trainspawned = true
            trainrunning = true
        else
            RSGCore.Functions.Notify('Train already running!!', 5000) 
        end
    -- else
        -- RSGCore.Functions.Notify('you do not work for the railroad!', 5000) 
    -- end
end)

CreateThread(function()
    while true do
        local t = 1000

        if trainrunning then
            t= 4

            for i = 1, #Config.stops do
                local coords = GetEntityCoords(CURRENT_TRAIN)
                local trainV = vector3(coords.x, coords.y, coords.z)
                local distance = #(Config.stops[i].coords - trainV)
                local stopspeed = 0.0
                local cruisespeed = 5.0
                local fullspeed = 15.0

                if distance < Config.stops[i].dst then
                    SetTrainCruiseSpeed(CURRENT_TRAIN, cruisespeed)

                    Wait(200)

                    if distance < Config.stops[i].dst2 then
                        SetTrainCruiseSpeed(CURRENT_TRAIN, stopspeed)
                        Config.printdebug('Train Stopped At: '..Config.stops[i].name)

                        Wait(Config.stops[i].time)

                        Config.printdebug('Train Leaving From: '..Config.stops[i].name)
                        SetTrainCruiseSpeed(CURRENT_TRAIN, cruisespeed)

                        Wait(10000)
                    end
                elseif distance > Config.stops[i].dst then
                    SetTrainCruiseSpeed(CURRENT_TRAIN, fullspeed)

                    Wait(25)
                end
            end
        end

        Wait(t)
    end
end)

-- if Config.debug then
    RegisterCommand('deletetrain', function()
        -- if RSGCore.Functions.GetPlayerData().job.name == 'railroad' then
            DeleteEntity(CURRENT_TRAIN)

            trainspawned = false
            trainrunning = false
        -- else
            -- RSGCore.Functions.Notify('you do not work for the railroad!', 5000)
        -- end
    end)
-- end