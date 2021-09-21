ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(100)
	end
end)

-- wz-accessories

RMenu.Add('accessoire', 'main', RageUI.CreateMenu("Accessoires", "Boutique Accessoires Armurerie"))
RMenu:Get('accessoire', 'main'):SetRectangleBanner(0, 0, 0, 10)

Citizen.CreateThread(function()
    while true do
        RageUI.IsVisible(RMenu:Get('accessoire', 'main'), true, true, true, function()

            FreezeEntityPosition(PlayerPedId(), true)
            FreezeEntityPosition(PlayerPedId(), false)

    RageUI.Separator("↓ ~o~Accessoires Armes~w~ ↓")

            RageUI.Button("Poignée", "Acheter l'item ~o~Poignée~s~ pour ~p~300$", {RightLabel = "~p~300$"}, true, function(Hovered, Active, Selected)
                if (Selected) then
                    TriggerServerEvent('{-WayZe#0001-}::BuyPoignée')
                end
            end)

            RageUI.Button("Lampe", "Acheter l'item ~o~Lampe~s~ pour ~p~500$", {RightLabel = "~p~500$"}, true, function(Hovered, Active, Selected)
                if (Selected) then
                    TriggerServerEvent('{-WayZe#0001-}::BuyLampe')
                end
            end)

            RageUI.Button("Silencieux", "Acheter l'item ~o~Silencieux~s~ pour ~p~750$", {RightLabel = "~p~750$"}, true, function(Hovered, Active, Selected)
                if (Selected) then
                    TriggerServerEvent('{-WayZe#0001-}::BuySilencieux')
                end
            end)

            RageUI.Button("Skin Arme", "Acheter l'item ~o~Skin Arme~s~ pour ~p~2000$", {RightLabel = "~p~2000$"}, true, function(Hovered, Active, Selected)
                if (Selected) then
                    TriggerServerEvent('{-WayZe#0001-}::BuySkin')
                end
            end)

    RageUI.Separator("↓ ~o~Accessoires Divers~w~ ↓")

            RageUI.Button("Parachute", "Acheter l'item ~o~Parachute~s~ pour ~p~800$", {RightLabel = "~p~800$"}, true, function(Hovered, Active, Selected)
                if (Selected) then
                    TriggerServerEvent('{-WayZe#0001-}::BuyParachute')
                end
            end)

            RageUI.Button("Chargeur", "Acheter l'item ~o~Chargeur~s~ pour ~p~1500$", {RightLabel = "~p~1500$"}, true, function(Hovered, Active, Selected)
                if (Selected) then
                    TriggerServerEvent('{-WayZe#0001-}::BuyChargeur')
                end
            end)

            end, function()
            end, 1)
    
            Citizen.Wait(1)
        end
    end)


local positionmenu = {
    {x = 18.47 , y = -1109.9, z = 29.8, }
}    
    
    
    Citizen.CreateThread(function()
        while true do
            local wait = 500
            for k in pairs(positionmenu) do
    
                local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
                local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, positionmenu[k].x, positionmenu[k].y, positionmenu[k].z)
    
                if dist <= 1.0 then
                    wait = 0
                    ESX.ShowHelpNotification("Appuyez sur [~p~E~w~] pour parler à ~p~John")
                    if IsControlJustPressed(1,51) then
                        RageUI.Visible(RMenu:Get('accessoire', 'main'), not RageUI.Visible(RMenu:Get('accessoire', 'main')))
                    end
                end
            end
            Citizen.Wait(wait)
        end
    end)

    Citizen.CreateThread(function()
    local hash = GetHashKey("cs_josef")
    while not HasModelLoaded(hash) do
    RequestModel(hash)
    Wait(50)
    end
    ped = CreatePed("PED_TYPE_CIVFEMALE", "cs_josef", 17.22, -1109.46, 28.8, 248.29, false, true)
    SetBlockingOfNonTemporaryEvents(ped, true)
    FreezeEntityPosition(ped, true)
    TaskStartScenarioInPlace(ped, "WORLD_HUMAN_GUARD_STAND_FACILITY", 0, false)
    SetEntityInvincible(ped, true)
end)



-----------------------------------------------------------------------
-----------------------------------------------------------------------
-- [NE PAS TOUCHER] Code qui permet d'utiliser les items pour les armes
-----------------------------------------------------------------------
-----------------------------------------------------------------------

local weapons = {
    [GetHashKey('WEAPON_PISTOL')] = { suppressor = GetHashKey('component_at_pi_supp_02'), flashlight = GetHashKey('COMPONENT_AT_PI_FLSH'), grip = nil, skin = GetHashKey('COMPONENT_PISTOL_VARMOD_LUXE') },
    [GetHashKey('WEAPON_PISTOL50')] = { suppressor = GetHashKey('COMPONENT_AT_AR_SUPP_02'), flashlight = GetHashKey('COMPONENT_AT_PI_FLSH'), grip = nil, skin = GetHashKey('COMPONENT_PISTOL50_VARMOD_LUXE') },
    [GetHashKey('WEAPON_COMBATPISTOL')] = { suppressor = GetHashKey('COMPONENT_AT_PI_SUPP'), flashlight = GetHashKey('COMPONENT_AT_PI_FLSH'), grip = nil, skin = nil },
    [GetHashKey('WEAPON_APPISTOL')] = { suppressor = GetHashKey('COMPONENT_AT_PI_SUPP'), flashlight = GetHashKey('COMPONENT_AT_PI_FLSH'), grip = nil, skin = GetHashKey('COMPONENT_APPISTOL_VARMOD_LUXE') },
    [GetHashKey('WEAPON_HEAVYPISTOL')] = { suppressor = GetHashKey('COMPONENT_AT_PI_SUPP'), flashlight = GetHashKey('COMPONENT_AT_PI_FLSH'), grip = nil, skin = GetHashKey('COMPONENT_HEAVYPISTOL_VARMOD_LUXE') },
    [GetHashKey('WEAPON_VINTAGEPISTOL')] = { suppressor = GetHashKey('COMPONENT_AT_PI_SUPP'), flashlight = nil, grip = nil, skin = nil },
    [GetHashKey('WEAPON_SMG')] = { suppressor = GetHashKey('COMPONENT_AT_PI_SUPP'), flashlight = GetHashKey('COMPONENT_AT_AR_FLSH'), grip = nil, skin = GetHashKey('COMPONENT_SMG_VARMOD_LUXE') },
    [GetHashKey('WEAPON_MICROSMG')] = { suppressor = GetHashKey('COMPONENT_AT_AR_SUPP_02'), flashlight = GetHashKey('COMPONENT_AT_PI_FLSH'), grip = nil, skin = GetHashKey('COMPONENT_MICROSMG_VARMOD_LUXE') },
    [GetHashKey('WEAPON_ASSAULTSMG')] = { suppressor = GetHashKey('COMPONENT_AT_AR_SUPP_02'), flashlight = GetHashKey('COMPONENT_AT_AR_FLSH'), grip = nil, skin = nil },
    [GetHashKey('WEAPON_ASSAULTRIFLE')] = { suppressor = GetHashKey('COMPONENT_AT_AR_SUPP_02'), flashlight = GetHashKey('COMPONENT_AT_AR_FLSH'), grip = GetHashKey('COMPONENT_AT_AR_AFGRIP'), skin = GetHashKey('COMPONENT_ASSAULTRIFLE_VARMOD_LUXE') },
    [GetHashKey('WEAPON_CARBINERIFLE')] = { suppressor = GetHashKey('COMPONENT_AT_AR_SUPP'), flashlight = GetHashKey('COMPONENT_AT_AR_FLSH'), grip = GetHashKey('COMPONENT_AT_AR_AFGRIP'), skin = GetHashKey('COMPONENT_CARBINERIFLE_VARMOD_LUXE') },
    [GetHashKey('WEAPON_ADVANCEDRIFLE')] = { suppressor = GetHashKey('COMPONENT_AT_AR_SUPP'), flashlight = GetHashKey('COMPONENT_AT_AR_FLSH'), grip = nil, skin = GetHashKey('COMPONENT_ADVANCEDRIFLE_VARMOD_LUXE') },
    [GetHashKey('WEAPON_SPECIALCARBINE')] = { suppressor = GetHashKey('COMPONENT_AT_AR_SUPP_02'), flashlight = GetHashKey('COMPONENT_AT_AR_FLSH'), grip = GetHashKey('COMPONENT_AT_AR_AFGRIP'), skin = nil },
    [GetHashKey('WEAPON_BULLPUPRIFLE')] = { suppressor = GetHashKey('COMPONENT_AT_AR_SUPP'), flashlight = GetHashKey('COMPONENT_AT_AR_FLSH'), grip = GetHashKey('COMPONENT_AT_AR_AFGRIP'), skin = nil },
    [GetHashKey('WEAPON_ASSAULTSHOTGUN')] = { suppressor = GetHashKey('COMPONENT_AT_AR_SUPP'), flashlight = GetHashKey('COMPONENT_AT_AR_FLSH'), grip = GetHashKey('COMPONENT_AT_AR_AFGRIP'), skin = nil },
    [GetHashKey('WEAPON_HEAVYSHOTGUN')] = { suppressor = GetHashKey('COMPONENT_AT_AR_SUPP_02'), flashlight = GetHashKey('COMPONENT_AT_AR_FLSH'), grip = GetHashKey('COMPONENT_AT_AR_AFGRIP'), skin = nil },
    [GetHashKey('WEAPON_BULLPUPSHOTGUN')] = { suppressor = GetHashKey('COMPONENT_AT_AR_SUPP_02'), flashlight = GetHashKey('COMPONENT_AT_AR_FLSH'), grip = GetHashKey('COMPONENT_AT_AR_AFGRIP'), skin = nil },
    [GetHashKey('WEAPON_PUMPSHOTGUN')] = { suppressor = GetHashKey('COMPONENT_AT_SR_SUPP'), flashlight = GetHashKey('COMPONENT_AT_AR_FLSH'), grip = nil, skin = nil },
    [GetHashKey('WEAPON_MARKSMANRIFLE')] = { suppressor = GetHashKey('COMPONENT_AT_AR_SUPP'), flashlight = GetHashKey('COMPONENT_AT_AR_FLSH'), grip = GetHashKey('COMPONENT_AT_AR_AFGRIP'), skin = nil },
    [GetHashKey('WEAPON_SNIPERRIFLE')] = { suppressor = GetHashKey('COMPONENT_AT_AR_SUPP_02'), flashlight = nil, grip = nil, skin = nil },
    [GetHashKey('WEAPON_COMBATPDW')] = { suppressor = nil, flashlight = GetHashKey('COMPONENT_AT_AR_FLSH'), grip = GetHashKey('COMPONENT_AT_AR_AFGRIP'), skin = nil }
}
 
RegisterNetEvent('eden_accesories:use')
AddEventHandler('eden_accesories:use', function( type )
    if weapons[GetSelectedPedWeapon(PlayerPedId())] and weapons[GetSelectedPedWeapon(PlayerPedId())][type] then
        if not HasPedGotWeaponComponent(GetPlayerPed(-1), GetSelectedPedWeapon(PlayerPedId()), weapons[GetSelectedPedWeapon(PlayerPedId())][type]) then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetSelectedPedWeapon(PlayerPedId()), weapons[GetSelectedPedWeapon(PlayerPedId())][type])  
            ESX.ShowNotification(string.format('%s %s', "Vous avez équipé votre ", type))
        else
            RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetSelectedPedWeapon(PlayerPedId()), weapons[GetSelectedPedWeapon(PlayerPedId())][type])  
            ESX.ShowNotification(string.format('%s %s', "Vous avez retiré votre ", type))
        end
    else
        ESX.ShowNotification(string.format('%s %s %s', 'Ce', type, "ne va pas sur ton arme.."))
    end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		if IsControlJustPressed(0, 172) then
			if weapons[GetSelectedPedWeapon(PlayerPedId())] then
				for k,v in pairs(weapons) do
					if GetSelectedPedWeapon(PlayerPedId()) == k then
						if HasPedGotWeaponComponent(GetPlayerPed(-1), GetSelectedPedWeapon(PlayerPedId()), v.suppressor) then
							TriggerServerEvent('eden_accesories:giveBack', 'suppressor')
							ESX.ShowNotification("Vous avez retiré votre Silencieux")
							RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetSelectedPedWeapon(PlayerPedId()), v.suppressor)
						elseif HasPedGotWeaponComponent(GetPlayerPed(-1), GetSelectedPedWeapon(PlayerPedId()), v.flashlight) then
							TriggerServerEvent('eden_accesories:giveBack', 'flashlight')
							ESX.ShowNotification("Vous avez retiré votre Lampe")
							RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetSelectedPedWeapon(PlayerPedId()), v.flashlight)
						elseif HasPedGotWeaponComponent(GetPlayerPed(-1), GetSelectedPedWeapon(PlayerPedId()), v.skin) then
							TriggerServerEvent('eden_accesories:giveBack', 'yusuf')
							ESX.ShowNotification("Vous avez retiré votre Skin d'Arme")
							RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetSelectedPedWeapon(PlayerPedId()), v.skin)
						elseif HasPedGotWeaponComponent(GetPlayerPed(-1), GetSelectedPedWeapon(PlayerPedId()), v.grip) then
							TriggerServerEvent('eden_accesories:giveBack', 'grip')
							ESX.ShowNotification("Vous avez retiré votre Poignée")
							RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetSelectedPedWeapon(PlayerPedId()), v.grip)
						end
					end
				end
			end
		end
	end
end)

RegisterNetEvent('esx_clip:clipcli')
AddEventHandler('esx_clip:clipcli', function()
  ped = GetPlayerPed(-1)
  if IsPedArmed(ped, 4) then
    hash=GetSelectedPedWeapon(ped)
    if hash~=nil then
      TriggerServerEvent('esx_clip:remove')
      AddAmmoToPed(GetPlayerPed(-1), hash,25)
      ESX.ShowNotification("Tu as utilisé un chargeur")
    else
      ESX.ShowNotification("Tu n'as pas d'arme en main")
    end
  else
    ESX.ShowNotification("Ce type de munition ne convient pas")
  end
end)

-- Script créé par WayZe#0001