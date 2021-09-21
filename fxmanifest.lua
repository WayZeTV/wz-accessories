fx_version 'cerulean'
game 'gta5'
author 'WayZe#0001'
description "wz-accessories achat d'accessoires à l'armurerie"
version '1.0.0'

client_scripts {
    "src/RMenu.lua",
    "src/menu/RageUI.lua",
    "src/menu/Menu.lua",
    "src/menu/MenuController.lua",
    "src/components/*.lua",
    "src/menu/elements/*.lua",
    "src/menu/items/*.lua",
    "src/menu/panels/*.lua",
    "src/menu/panels/*.lua",
    "src/menu/windows/*.lua",

	"client.lua",
}

server_scripts {
	'server.lua'
}


dependencies {
	'es_extended'
}

-- Script créé par WayZe#0001