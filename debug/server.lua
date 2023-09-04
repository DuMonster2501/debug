
local Tunnel = module("vrp","lib/Tunnel") 
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
DuMonster = {}
Tunnel.bindInterface("debug",DuMonster)
Client = Tunnel.getInterface("debug")

Citizen.CreateThread(function()
    print("^2Script Iniciado^7")
end)

RegisterCommand("debugadmin",function(source,rawCommand)
	local source = source
	local user_id = vRP.getUserId(source)
    local Passport = vRP.Passport(source)
    if Config.Base == "CreativeV4" or Config.Base == Creative.Base == "CreativeV5" then
        if user_id then
            if vRP.hasGroup(user_id,"Admin") then
				TriggerClientEvent("debug:toogle",source)
			end
		end
    elseif Config.Base == "CreativeV6" then 
        if Passport then
            if vRP.hasGroup(Passport,"Admin") then
				TriggerClientEvent("debug:toogle",source)
			end
		end
    end
end)