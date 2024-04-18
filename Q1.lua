--Q1 - Fix or improve the implementation of the below methods

-- remove magic numbers
local storageKey = 1000
local storageEventTime = 1000

-- add error handling to the function
local function releaseStorage(player)
    if player then
        local success = player:setStorageValue(storageKey, -1)
        if not success then
            print("Failed to release storage for player")
        end
    else
        print("Cannot release storage for nil player")
    end
end

function onLogout(player)
    if player:getStorageValue(storageKey) == 1 then
        addEvent(releaseStorage, storageEventTime, player)
    end

    return true
end
