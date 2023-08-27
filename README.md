# RexshackGaming
- discord : https://discord.gg/s5uSk56B65
- youtube : https://www.youtube.com/channel/UCikEgGfXO-HCPxV5rYHEVbA
- github : https://github.com/Rexshack-RedM

# Dependancies
- rsg-core
- rsg-menu
- rsg-npcs

# Installation
- ensure that the dependancies are added and started
- add rsg-railroadjob to your resources folder

# Add Job
- add the following to rsg-core/shared/jobs.lua if not there already
```
    ['railroad'] = {
        label = 'Railroad',
        defaultDuty = true,
        offDutyPay = false,
        grades = {
            ['0'] = {
                name = 'Conductor',
                payment = 25
            },
            ['1'] = {
                name = 'Driver',
                payment = 50
            },
            ['2'] = {
                name = 'Station Manager',
                isboss = true,
                payment = 75
            },
        },
    },
```

# Add NPC
- add the following NPC to rsg-npcs/config.lua if not there already
```
    {   -- railroad job npc
        model = `U_M_O_RigTrainStationWorker_01`,
        coords = vector4(-162.6976, 638.8612, 114.03211, 146.25543),
    },
```

# Starting the resource
- add the following to your server.cfg file : ensure rsg-railroadjob

# Commands Use
- /deletetrain (deletes train at its current location)
- /resettrain (resets you back to valentine station)
