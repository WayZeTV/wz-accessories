ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

-- Accessoires Armes 

RegisterNetEvent('{-WayZe#0001-}::BuyPoignée')
AddEventHandler('{-WayZe#0001-}::BuyPoignée', function()

    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = 300
    local xMoney = xPlayer.getMoney()

    if xMoney >= price then

        xPlayer.removeMoney(price)
        xPlayer.addInventoryItem('grip', 1)
        TriggerClientEvent('esx:showNotification', source, "~g~Félicitation~s~ ! Vous venez d'acheter une ~o~Poignée")
    else
         TriggerClientEvent('esx:showNotification', source, "Vous n'avez pas assez ~r~d\'argent")
    end
end)

RegisterNetEvent('{-WayZe#0001-}::BuyLampe')
AddEventHandler('{-WayZe#0001-}::BuyLampe', function()

    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = 500
    local xMoney = xPlayer.getMoney()

    if xMoney >= price then

        xPlayer.removeMoney(price)
        xPlayer.addInventoryItem('flashlight', 1)
        TriggerClientEvent('esx:showNotification', source, "~g~Félicitation~s~ ! Vous venez d'acheter une ~o~Lampe")
    else
         TriggerClientEvent('esx:showNotification', source, "Vous n'avez pas assez ~r~d\'argent")
    end
end)

RegisterNetEvent('{-WayZe#0001-}::BuySilencieux')
AddEventHandler('{-WayZe#0001-}::BuySilencieux', function()

    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = 750
    local xMoney = xPlayer.getMoney()

    if xMoney >= price then

        xPlayer.removeMoney(price)
        xPlayer.addInventoryItem('suppressor', 1)
        TriggerClientEvent('esx:showNotification', source, "~g~Félicitation~s~ ! Vous venez d'acheter un ~o~Silencieux")
    else
         TriggerClientEvent('esx:showNotification', source, "Vous n'avez pas assez ~r~d\'argent")
    end
end)

RegisterNetEvent('{-WayZe#0001-}::BuySkin')
AddEventHandler('{-WayZe#0001-}::BuySkin', function()

    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = 800
    local xMoney = xPlayer.getMoney()

    if xMoney >= price then

        xPlayer.removeMoney(price)
        xPlayer.addInventoryItem('yusuf', 1)
        TriggerClientEvent('esx:showNotification', source, "~g~Félicitation~s~ ! Vous venez d'acheter un ~o~Skin Arme")
    else
         TriggerClientEvent('esx:showNotification', source, "Vous n'avez pas assez ~r~d\'argent")
    end
end)

-- Accessoires

RegisterNetEvent('{-WayZe#0001-}::BuyParachute')
AddEventHandler('{-WayZe#0001-}::BuyParachute', function()

    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = 800
    local xMoney = xPlayer.getMoney()

    if xMoney >= price then

        xPlayer.removeMoney(price)
        xPlayer.addWeapon('GADGET_PARACHUTE', 1)
        TriggerClientEvent('esx:showNotification', source, "~g~Félicitation~s~ ! Vous venez d'acheter un ~o~Parachute")
    else
         TriggerClientEvent('esx:showNotification', source, "Vous n'avez pas assez ~r~d\'argent")
    end
end)

RegisterNetEvent('{-WayZe#0001-}::BuyChargeur')
AddEventHandler('{-WayZe#0001-}::BuyChargeur', function()

    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = 1500
    local xMoney = xPlayer.getMoney()

    if xMoney >= price then

        xPlayer.removeMoney(price)
        xPlayer.addInventoryItem('clip', 1)
        TriggerClientEvent('esx:showNotification', source, "~g~Félicitation~s~ ! Vous venez d'acheter un ~o~Chargeur")
    else
         TriggerClientEvent('esx:showNotification', source, "Vous n'avez pas assez ~r~d\'argent")
    end
end)

-- [NE PAS TOUCHER] Code qui permet d'utiliser les items pour les armes

ESX.RegisterUsableItem('suppressor', function( source )
	local _source  = source
	local xPlayer  = ESX.GetPlayerFromId(_source)
    TriggerClientEvent('eden_accesories:use', source, 'suppressor')
	xPlayer.removeInventoryItem('suppressor', 1)
end)
 
ESX.RegisterUsableItem('flashlight', function( source )
	local _source  = source
	local xPlayer  = ESX.GetPlayerFromId(_source)
    TriggerClientEvent('eden_accesories:use', source, 'flashlight')
	xPlayer.removeInventoryItem('flashlight', 1)
end)
 
ESX.RegisterUsableItem('grip', function( source )
	local _source  = source
	local xPlayer  = ESX.GetPlayerFromId(_source)
    TriggerClientEvent('eden_accesories:use', source, 'grip')
	xPlayer.removeInventoryItem('grip', 1)
end)
 
ESX.RegisterUsableItem('yusuf', function( source )
	local _source  = source
	local xPlayer  = ESX.GetPlayerFromId(_source)
    TriggerClientEvent('eden_accesories:use', source, 'skin')
	xPlayer.removeInventoryItem('yusuf', 1)
end)

RegisterServerEvent('eden_accesories:giveBack')
AddEventHandler('eden_accesories:giveBack', function(item)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	xPlayer.addInventoryItem(item, 1)
end)

RegisterServerEvent('esx_clip:remove')
AddEventHandler('esx_clip:remove', function()
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('clip', 1)
end)

ESX.RegisterUsableItem('clip', function(source)
	TriggerClientEvent('esx_clip:clipcli', source)
end)

-- Script créé par WayZe#0001