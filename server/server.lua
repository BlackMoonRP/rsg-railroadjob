local RSGCore = exports['rsg-core']:GetCoreObject()

RSGCore.Commands.Add('kereta', 'Test Kereta', {}, false, function(source)
    local src = source

    TriggerClientEvent('rsg-railroadjob:client:menu', src)
end, 'staff')