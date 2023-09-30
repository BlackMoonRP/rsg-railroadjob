fx_version 'cerulean'
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'
game 'rdr3'

author 'RexShack#3041'
description 'rsg-railroadjob'
version '1.0.0'

shared_scripts {
    'config.lua',
}

client_scripts {
    'client/*lua',
}

server_scripts {
    'server/*lua'
}

dependencies {
    'rsg-core',
    'rsg-menu',
    'rsg-npcs'
}
