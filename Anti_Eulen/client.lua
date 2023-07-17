local resource_loaded = false
RegisterNetEvent("CheckEulen:r", function()
    old_timer = GetGameTimer()
end)
AddEventHandler("onResourceStart", function(res)
    if res == "just_a_script" and not resource_loaded then
        resource_loaded = true
            -- over 4000/5000 eulen
        if GetGameTimer()-old_timer > 4000 then
            TriggerServerEvent("BanEvent")
        end
    end
end)
TriggerServerEvent("CheckEulen")