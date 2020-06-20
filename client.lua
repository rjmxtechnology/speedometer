function round(n)
    return n % 1 >= 0.5 and math.ceil(n) or math.floor(n)
end

Citizen.CreateThread(function()
  while true do
        Citizen.Wait(1)
        if(IsPedInAnyVehicle(GetPlayerPed(-1), false)) then
            local kmh = round(GetEntitySpeed(GetVehiclePedIsIn(GetPlayerPed(-1), false))*3.6)
            --local mph = round(GetEntitySpeed(GetVehiclePedIsIn(GetPlayerPed(-1), false))*2.236936) --uncomment this and comment the one above for mp/h
            local plate = GetVehicleNumberPlateText(GetVehiclePedIsIn(GetPlayerPed(-1), false))
            local radio = GetPlayerRadioStationName(GetVehiclePedIsIn(GetPlayerPed(-1), false))
            local fuel = round(GetVehicleFuelLevel(GetVehiclePedIsIn(GetPlayerPed(-1), false))*1.54)
            local gear = GetVehicleCurrentGear(GetVehiclePedIsIn(GetPlayerPed(-1), false))

            if radio == nil then
                radio = "OFF"
            end
            if radio == "RADIO_09_HIPHOP_OLD" then
                radio = "National FM"
            end
            if radio == "RADIO_08_MEXICAN" then
                radio = "Radio Rock"
            end
            if radio == "RADIO_07_DANCE_01" then
                radio = "Radio Bisericesc"
            end
            if radio == "RADIO_06_COUNTRY" then
                radio = "Manele 2"
            end
            if radio == "RADIO_05_TALK_01" then
                radio = "Muzica Populara"
            end
            if radio == "RADIO_04_PUNK" then
                radio = "Manele"
            end
            if radio == "RADIO_03_HIPHOP_NEW" then
                radio = "Radio Sport 1"
            end
            if radio == "RADIO_02_POP" then
                radio = "Radio Techno"
            end
            if radio == "RADIO_01_CLASS_ROCK" then
                radio = "Gaming"
            end
            if radio == "RADIO_22_DLC_BATTLE_MIX1_RADIO" then
                radio = "Los Santos Underground"
            end
            if radio == "RADIO_21_DLC_XM17" then
                radio = "Blonded Los Santos 97.8 FM"
            end
            if radio == "RADIO_18_90S_ROCK" then
                radio = "Mix Music Radio Dance"
            end
            if radio == "RADIO_17_FUNK" then
                radio = "Aquarelle FM MOLDOVA"
            end
            if radio == "RADIO_16_SILVERLAKE" then
                radio = "Radio Lumina"
            end
            if radio == "RADIO_20_THELAB" then
                radio = "Digi FM"
            end
            if radio == "RADIO_15_MOTOWN" then
                radio = "Radio HITFM Manele"
            end
            if radio == "RADIO_14_DANCE_02" then
                radio = "Romania Actualitati"
            end
            if radio == "RADIO_13_JAZZ" then
                radio = "Pro FM"
            end
            if radio == "RADIO_12_REGGAE" then
                radio = "TexFM Romania Hits"
            end

            if kmh >= 140 then
                kmh = "~r~"..kmh
            else
            if kmh >= 100 then
                kmh = "~o~"..kmh
            else
                kmh = "~w~"..kmh
            end
        end

        --[[if mph >= 85 then
            mph = "~r~"..mph
        else
        if mph >= 60 then
            mph = "~o~"..mph
        else
            mph = "~w~"..mph
        end
    end]] -- uncomment this and comment the one above for mp/h

            drawText(7, 0.9, 0.7, 0.0, 0.0, kmh.." ~b~KM/H", 0.8, 0.8)
            --drawText(7, 0.9, 0.7, 0.0, 0.0, mph.." ~b~MP/H", 0.8, 0.8) -- uncomment this and comment the one above for mp/h
            drawText(4, 0.9, 0.73, 0.0, 0.0, "~b~Plate: ~w~"..plate, 0.7, 0.7)
            drawText(4, 0.9, 0.76, 0.0, 0.0, "~b~Radio: ~w~"..radio, 0.7, 0.7)
            drawText(4, 0.9, 0.79, 0.0, 0.0, "~b~Fuel: ~w~"..fuel, 0.7, 0.7)
            drawText(4, 0.9, 0.82, 0.0, 0.0, "~b~Gear: ~w~"..gear, 0.7, 0.7)

        end
    end
end)

function drawText(fontId, x,y ,width,height, text, scale, scale1)
SetTextFont(fontId)
SetTextProportional(0)
SetTextScale(scale, scale1)
--SetTextColour(255, 255, 255, 255) --change the color here
SetTextDropShadow(0, 0, 0, 0,200)
SetTextEdge(1, 0, 0, 0, 255)
SetTextDropShadow(1)
SetTextCentre(1)
SetTextOutline(1)
SetTextEntry("STRING")
AddTextComponentString(text)
DrawText(x - width/2, y - height/2 + 0.005)
end
