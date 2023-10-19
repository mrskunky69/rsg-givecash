CreateThread(function()
    exports['rsg-target']:AddPlayer({
        options = {
            { 
                type = "client",
                event = "tc-giveCash:client:menu",
                icon = "fas fa-money",
                label = "Give Cash",
            },
			{ 
                type = "client",
                event = "rsg-horses:client:tradehorse",
                icon = "horse",
                label = "trade horse",
            },
			{ 
                type = "client",
                event = "police:client:JailPlayer",
                icon = "user-lock",
                label = "jail person (police)",
				job = "police",
            },
			{ 
                type = "client",
                event = "police:client:CuffPlayerSoft",
                icon = "user-lock",
                label = "Cuff person (police)",
				job = "police",
            },
			{ 
                type = "client",
                event = "police:client:EscortPlayer",
                icon = "user-lock",
                label = "Escort person (police)",
				job = "police",
            },
			{ 
                type = "client",
                event = "police:client:RobPlayer",
                icon = "user-lock",
                label = "Rob person",
            },
			{ 
                type = "client",
                event = "rsg-medic:client:RevivePlayer",
                icon = "user-lock",
                label = "medic revive",
				job = "medic",
            },
		
        },
        distance = 5.0 
    })
end)


RegisterNetEvent('rsg-giveCash:client:menu', function()
    local input = exports['rsg-input']:ShowInput({
        header = "Give Cash",
        submitText = "Give Cash",
        inputs = {
            {
                type = 'number',
                isRequired = true,
                name = 'id',
                text = 'ID Of Player'
            },
            {
                type = 'number',
                isRequired = true,
                name = 'amount',
                text = '$ amount'
            }
        }
    })
    if input then
        if not input.id or not input.amount then return end
        TriggerServerEvent("rsg-giveCash:server:charge", input.id, input.amount)
    end
end)
