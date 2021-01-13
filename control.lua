local pipi = 0.0
local cacca = 0.0
local stato_pipi = true
local stato_popo = true

RegisterNetEvent("D_hud:scappa_pipi")
AddEventHandler("D_hud:scappa_pipi", function()
    print("scappa pipi",stato_pipi)
    if stato_pipi == true  then
        Citizen.Wait(1000)
        print("scappa_Ppipi",stato_pipi, stato_popo)
        ClearPedTasksImmediately(PlayerPedId(),true,true)
        TaskEmote(PlayerPedId(),0,2,GetHashKey("KIT_EMOTE_DANCE_OLD_A_1"),0,0,0,0,0)
        ClearPedTasks(PlayerPedId(),true,true)
    end
end)   

RegisterNetEvent("D_hud:scappa_popo")
AddEventHandler("D_hud:scappa_popo", function()
    print("scappa popo",stato_pupu)
    if stato_popo == true then
        Citizen.Wait(1000)
        
        print("scappa cacca",stato_pipi, stato_popo)
        ClearPedTasksImmediately(PlayerPedId(),true,true)
        TaskEmote(PlayerPedId(),0,2,GetHashKey("KIT_EMOTE_DANCE_OLD_A_1"),0,0,0,0,0)
        ClearPedTasks(PlayerPedId(),true,true)
    end
end)
RegisterNetEvent("D_hud:animazione_pipi")
AddEventHandler("D_hud:animazione_pipi", function()
    stato_pipi = false
    if pipi >=50 then
        TriggerServerEvent('3dme:shareDisplay', "Urinando")
        TaskStartScenarioInPlace(PlayerPedId(), GetHashKey('WORLD_HUMAN_PEE'), 30000, true, false, false, false)
		Citizen.Wait(15000)
		ClearPedTasks(PlayerPedId(), true, true)
		Citizen.Wait(1)
		TriggerEvent("D_hud:reset_pipi")
    else 
        TriggerEvent("redemrp_notification:start", "Non devi urinare" , 5, "warning")
    end
end)

RegisterNetEvent("D_hud:animazione_pupu")
AddEventHandler("D_hud:animazione_pupu", function()
    stato_popo = false
    if cacca >=50 then
		TriggerServerEvent('3dme:shareDisplay', "Defecando")
        TaskStartScenarioInPlace(PlayerPedId(), GetHashKey('WORLD_HUMAN_SIT_GROUND_READ_NEWSPAPER'), 30000, true, false, false, false)
		Citizen.Wait(30000)
		ClearPedTasks(PlayerPedId(), true, true)
		Citizen.Wait(1)
		TriggerEvent("D_hud:reset_pupu")
    else 
        TriggerEvent("redemrp_notification:start", "Non devi defecare" , 5, "warning")
    end
end)

RegisterNetEvent("D_hud:reset_pipi")
AddEventHandler("D_hud:reset_pipi", function()
    pipi =  -0.00001
    Wait(11000)
    stato_pipi = true
    print("reset pipi",pipi,stato_pipi)

end)


RegisterNetEvent("D_hud:reset_pupu")
AddEventHandler("D_hud:reset_pupu", function()
    cacca = -0.00001
    Wait(11000)
    stato_popo = true

end)

RegisterNetEvent("D_hud:bisogni")
AddEventHandler("D_hud:bisogni", function()
    print("is")
    while true do
        Wait(0)
        TriggerEvent("D_hud:StatoBisogni",pipi,cacca)
        Wait(1000)
        print("valore cacca",cacca)
        if cacca >= 99.99999 then
            Wait(9000)
            TriggerEvent("D_hud:scappa_popo")
        end
        print("valore pipi",pipi)
        if pipi >= 99.99999  then
            Wait(9000)
            TriggerEvent("D_hud:scappa_pipi")
        end
        
    end

end)

RegisterNetEvent("vorpmetabolism:useItem")
AddEventHandler("vorpmetabolism:useItem", function(value,item)
    print("sto_mangiando")
    array_moonshine_basso = {"Moonshine bassa qualità mirtillo",
    "Moonshine bassa qualità vaniglia",
    "Moonshine bassa qualità pera",
    "Moonshine bassa qualità ribes"}
        
    if "Acqua sporca" == item then
        pipi = pipi + 25.0
    elseif "Acqua pulita" == item then
        pipi = pipi + 100.0
    elseif "Caffè" == item then
        pipi = pipi + 33.3
    
    end

    for k,i in ipairs(array_moonshine_basso) do 
        if tostring(item) == tostring(i) then
            pipi = pipi + 37.3
        end
    end
    if pipi >= 100 then 
        pipi = 100
    end
    --Controllo Cibo
    
    array_carne_pesce = {"Carne di uccello cotta",
    "Carne di maiale cotta",
    "Carne di selvaggina cotta",
    "Carne cotta, stracotta",
    "Salmone alla brace",
    "Pesce alla brace",
    "Trota alla brace",
    "Rock bass alla brace"}
    if "Pera" == item then
        cacca = cacca + 5.0
    elseif "Mela" == item then
        cacca = cacca + 100
        
    elseif "Mirtillo" == item then
        cacca = cacca + 3.3
    elseif "Ribes" == item then
        cacca = cacca + 3.3
    elseif "Barattolo di fagioli" == item then
        cacca = cacca + 13.3
    elseif "Barattolo di salmone" == item then
        cacca = cacca + 13.3
    
    end

    for k,i in ipairs(array_carne_pesce) do 
        if tostring(item) == tostring(i) then
            cacca = cacca + 25.0
        end
    end
    if cacca >= 100 then 
        cacca =100
    end
    
    TriggerEvent("D_hud:bisogni")
end)