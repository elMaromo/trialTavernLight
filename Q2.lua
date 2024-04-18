--Q2 - Fix or improve the implementation of the below method

function printSmallGuildNames(memberCount)
    -- this method is supposed to print names of all guilds that have less than memberCount max members

    local selectGuildQuery = string.format("SELECT name FROM guilds WHERE max_members < %d;", memberCount)
    local resultId = db.storeQuery(selectGuildQuery)

    -- check if the result its nill before accesing it
    if resultId == false then
        print("No guilds found with less than " .. memberCount .. " members.")
        return false
    end

    -- iterate the result from the db
    repeat
        local guildName = result.getString(resultId, "name")
        print(guildName)
    until not result.next(resultId)

    -- Free the result set after use
    result.free(resultId)
end
