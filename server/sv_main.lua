local RSGCore = exports['rsg-core']:GetCoreObject()

RegisterNetEvent('rsg-giveCash:server:charge', function(id, amount)
    local src = source
    
    local giver = RSGCore.Functions.GetPlayer(src)
    local given = RSGCore.Functions.GetPlayer(tonumber(id))
    local givenPed = GetPlayerPed(tonumber(id))
    local giverPed = GetPlayerPed(src)
    if not giver or not given then return end
    if not giver.PlayerData.metadata["isdead"] then
        local check = #(GetEntityCoords(givenPed) - GetEntityCoords(giverPed))

        if check < 10.0 then
            if tonumber(amount) > 0 then
                if giver.Functions.RemoveMoney('cash', tonumber(amount)) then
                    given.Functions.AddMoney('cash', tonumber(amount))
                    TriggerClientEvent('RSGCore:Notify', src, 'Sent $'..tonumber(amount).." to"..id, 'success')
                end
            else
                TriggerClientEvent('RSGCore:Notify', src, 'Can\'t Send $0', 'error')
            end
        else
            TriggerClientEvent('RSGCore:Notify', src, 'Too far', 'error')
        end
    else
        TriggerClientEvent('RSGCore:Notify', src, 'Can\'t Send Money When Dead.', 'error')
    end
    

end)


