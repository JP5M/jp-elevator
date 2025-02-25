fx_version 'cerulean'
game 'gta5'

author 'JP5M Scripts'
description 'JP Elevator Script using ox_lib and ox_target'
version '1.1.0'

shared_scripts {
    '@ox_lib/init.lua',
    'config.lua'
}

client_scripts {
    'client.lua'
}

escrow_ignore {
    'config.lua',
    'client.lua',
    'server.lua'
}

dependencies {
    'ox_lib'
}

lua54 'yes'
