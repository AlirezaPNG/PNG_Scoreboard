
TriggerEvent('esx:getSharedObject', function(obj)
    ESX = obj
end)


function GetPlayerData(source)
    local xPlayer = ESX.GetPlayerFromId(tonumber(source))
    if xPlayer then
        return xPlayer
    else
        return nil
    end
end

function CheckIsOnAdmin(xPlayer)
    return xPlayer.get('aduty')
end

function GetJob(xPlayer)
    return xPlayer.job.name
end

function GetAllPlayers()
    local allplayers = {}
    local AllAdmins = 0
    local All_Jobs = {}

    All_Jobs['police'] = 0
    All_Jobs['sheriff'] = 0
    All_Jobs['ambulance'] = 0
    All_Jobs['mechanic'] = 0
    All_Jobs['taxi'] = 0
    
    for _,i in pairs(GetPlayers()) do
        local server = tonumber(i)
        if server then
            local x = GetPlayerData(server)
            if x then
                if CheckIsOnAdmin(x) then
                    AllAdmins = AllAdmins + 1
                end
                if All_Jobs[tostring(GetJob(x))] then
                    All_Jobs[tostring(GetJob(x))] = All_Jobs[tostring(GetJob(x))] + 1
                end
                allplayers[server] = {id = server, name = x.name, perm=x.permission_level, ping=GetPlayerPing(server)}
            end
        end
    end

    return allplayers, AllAdmins, All_Jobs
end

CreateThread(function()
    Wait(1500)
    while true do
        local players, admins, alljobs = GetAllPlayers()
        TriggerClientEvent('PNG_scoreboard:SendPlayers', -1, players, admins, alljobs)
        Wait(1000*5)
    end
end)

