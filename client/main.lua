-- Resource / HUD by Irthyy#2063 --

function text(content)
    SetTextFont(1)
    SetTextProportional(0)
    SetTextScale(1.5,1.5)  -- taille de l ecriture de la vitesse 
    SetTextEntry("STRING")
    AddTextComponentString("- " .. content .. " -")
    DrawText(0.45,0.85) -- position de l ecriture vitesse 
end

function text2(content)
    SetTextFont(4)
    SetTextProportional(0)
    SetTextScale(0.8,0.8) -- taille du texte
    SetTextEntry("STRING")
    AddTextComponentString("~b~KMh~s~")
    DrawText(0.48,0.93) -- position du texte km/h 
end

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)  -- wait pour ne pas faire crash (ne pas toucher)

        local vehspeed = GetEntitySpeed(GetVehiclePedIsIn(PlayerPedId(), false))*3.6  -- multipler factor for km/h -- facteur de multiplication pour les km/h

        if (IsPedInAnyVehicle(PlayerPedId(), false)) then  -- check si la personne est dans un vehicule 

            text2()  -- appel fonction 2 
            text(math.ceil(vehspeed))  -- appel fonction 1
        end
    end
end)

-- Irthyy#2063