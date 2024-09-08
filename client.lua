local show = false

function showDisplay(show)
    SendNUIMessage({
        showUI = show,
        limit = config.CountUserLimitInJob,
        islimit = config.ShowAllUserInJob
    })
end

Citizen.CreateThread(function()
    while true do
        Wait(5)

        if IsControlJustReleased(0, 57) and IsInputDisabled(0) then
            if show == false then
                show = true
                SetNuiFocus(true, true);
            elseif show == true then
                show = false
                SetNuiFocus(false, false);
            end
            showDisplay(show)
        end
    end
end)


RegisterNUICallback('hide', function(data, cb)
    if show == false then
        show = true
        SetNuiFocus(true, true);
    elseif show == true then
        show = false
        SetNuiFocus(false, false);
    end
    showDisplay(show)
end)




-- info
function palyernum(num)
    SendNUIMessage({
        palyernum = num
    })
end

function police(num)
    SendNUIMessage({
        police = num
    })
end

function medic(num)
    SendNUIMessage({
        medic = num
    })
end

function mechanic(num)
    SendNUIMessage({
        mechanic = num
    })
end

function sheriff(num)
    SendNUIMessage({
        sheriff = num
    })
end

function taxi(num)
    SendNUIMessage({
        taxi = num
    })
end

--


RegisterNetEvent('PNG_scoreboard:SendPlayers')
AddEventHandler('PNG_scoreboard:SendPlayers', function(allplayer, admins, alljobs)
    police(alljobs['police'])
    mechanic(alljobs['mechanic'])
    medic(alljobs['ambulance'])
    sheriff(alljobs['sheriff'])
    taxi(alljobs['taxi'])
    local Players = 0
    for _, i in pairs(allplayer) do
        Players = Players + 1
    end
    palyernum(Players)
end)
