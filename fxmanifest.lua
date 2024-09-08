client_script "@mapmanager/koobs.lua"
server_script "@mapmanager/koobs_sv.lua"
fx_version 'cerulean'
games { 'rdr3', 'gta5' }

author 'John Doe <j.doe@example.com>'
description 'Example resource'
version '1.0.0'


-- What to run
client_scripts {
    'client.lua',
}
server_script {
    'server.lua',
}

ui_page {
    'ui/html/index.html'
}

files {
    "ui/**",
}
