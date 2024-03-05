local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('qb-motorwaymaintence:server:taskPayout', function(newtask)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local payout = math.random(Config.MinPayout, Config.MaxPayout)
    if not Player then return end
    taskcoords = newtask
    if Player.PlayerData.job.name == "motorwaymaintence" then
        if #(GetEntityCoords(GetPlayerPed(src)) - taskcoords) < 4.0 then
            Player.Functions.AddMoney(Config.MoneyType, payout)
            TriggerClientEvent('QBCore:Notify', src, "You were paid $"..payout.." for completing the job.", "success")
        else
            TriggerEvent('qb-log:server:CreateLog', 'anticheat', 'qb-motorwaymaintence', 'red', '**Identifier**: `'..GetPlayerName(src) .. '` \n**Character**: `'..Player.PlayerData.charinfo.firstname .. ' ' .. Player.PlayerData.charinfo.lastname ..'`\n**CID**: `'..Player.PlayerData.citizenid..'`\n**ID**: `'..src..'`\n**License**: `'..Player.PlayerData.license..'`\n\n **tried to exploit the qb-motorwaymaintence payout event**', true)
            DropPlayer(src, "Attempted to Exploit qb-motorwaymaintence")
            print("CHEATER CHEATER CHEATER")
        end
    end
end)

RegisterNetEvent('qb-motorwaymaintence:server:SetJob', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if #(GetEntityCoords(GetPlayerPed(src)) - vector3(Config.BossCoords.x,Config.BossCoords.y,Config.BossCoords.z)) < 4.0 then
        if Player.PlayerData.job.name ~= "motorwaymaintence" then
            Player.Functions.SetJob("motorwaymaintence", "0")
            TriggerClientEvent('QBCore:Notify', src, "You are now clocked in as motorwaymaintence.", "success")
        end
    else
        TriggerEvent('qb-log:server:CreateLog', 'anticheat', 'motorwaymaintence', 'red', '**Identifier**: `'..GetPlayerName(src) .. '` \n**Character**: `'..Player.PlayerData.charinfo.firstname .. ' ' .. Player.PlayerData.charinfo.lastname ..'`\n**CID**: `'..Player.PlayerData.citizenid..'`\n**ID**: `'..src..'`\n**License**: `'..Player.PlayerData.license..'`\n\n **triggered the server event for qb-motorwaymaintence without being near the spot.**', true)
        DropPlayer(src, "Attempted to Exploit motorwaymaintence")
        print("CHEATER CHEATER CHEATER")
    end
end)

Citizen.CreateThread(function()
    local resourceName = "qb-MotorwayMaintinance Started } Discord : https://discord.gg/8JdxQNRXVj  made by Slim Shady ("..GetCurrentResourceName()..")"
    print("\n^4----------------------------------------------------------------------------------^7")
    print(resourceName)
    print("^4----------------------------------------------------------------------------------^7")
end)