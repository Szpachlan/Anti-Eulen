local eulen_Check_Players = {}
local AlreadyChecking = false
RegisterNetEvent("CheckEulen", function()
    eulen_Check_Players[#eulen_Check_Players+1] = source
    if not AlreadyChecking then
        AlreadyChecking = true
        Wait(7500)
        for i = 1, #eulen_Check_Players do
            local p = eulen_Check_Players[i]
            TriggerClientEvent("CheckEulen:r", p)
        end
        ExecuteCommand("ensure just_a_script")
        AlreadyChecking = false
        eulen_Check_Players = {}
    end
end)
RegisterNetEvent("BanEvent")
AddEventHandler("BanEvent", function()
    local _source = tonumber(source)
    local player_ping = GetPlayerPing(_source)
    if player_ping > 500 then
        print("Dropping Player: ".. _source ..", Maximum ping exceed rejoin to server")
        DropPlayer(_source, "Maximum ping exceed rejoin to server")
    else
        print(_source, "Eulen Detected ("..player_ping..")")
        if not fiveguardbans then
            DropPlayer(_source, "Eulen Detected")
        else
            exports[fiveguardname]:fg_BanPlayer(_source, "Eulen detected", true)
        end
    end
end)
