money = 0
mystress = nil
isloaded = false
local animazione = false
local pipi = 0.0
local cacca = 0
local stato_pipi = true
local stato_popo = true
RegisterCommand('pipi', function()
	TriggerEvent("D_hud:animazione_pipi")
 
end)
RegisterCommand('pupu', function()
	TriggerEvent("D_hud:animazione_pupu")
 
end)

RegisterNetEvent("vorp:SelectedCharacter")
AddEventHandler("vorp:SelectedCharacter", function(charid)
    isloaded = true
end)

RegisterNetEvent("D_hud:StatoBisogni")
AddEventHandler("D_hud:StatoBisogni", function(p,c)
    pipi = p
    cacca =c
    print("p",p)
    print("c",c)
end)

isloaded = true


Citizen.CreateThread(function()
     while true do
        Citizen.Wait(10)
        if isloaded then
            local _source = source 
        --	TriggerServerEvent("hud:checkmoney")
            Citizen.InvokeNative(0x50C803A4CD5932C5 , true)
            local myhunger
            local mythirst
            local player = PlayerPedId()
            local coords = GetEntityCoords(player)
            Citizen.InvokeNative(0xB98B78C3768AF6E0,true)
            local temp = GetTemperatureAtCoords(coords)
            local _src = source
          
            
            
            TriggerEvent("vorpmetabolism:getValue","Thirst",function(value)
                if value == nil then
                    mythirst = 0
                else
                
                    mythirst = value / 10
                end
            end)
            
            TriggerEvent("vorpmetabolism:getValue","Hunger",function(value)  
                if value == nil then
                    myhunger = 0                    
                else
                    
                    myhunger = value / 10
                end
            end)

                
            SendNUIMessage({
                action = "updateStatusHud",
                    show = not IsRadarHidden(),
                    hunger = myhunger,
                    thirst = mythirst,
                    poop = cacca,
                    pee = pipi,
				--stress = mystress,
                   temp= math.floor(temp).."°C", -- You can switch to C by commenting the line above, and uncommenting this line.
            })
           
            Citizen.Wait(1000)
        end
    end
end)