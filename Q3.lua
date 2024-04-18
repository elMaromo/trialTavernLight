--Q3 - Fix or improve the name and the implementation of the below method

-- change the name of the function to convey its use
function removeMemberFromParty(playerId, memberName)
    --make the variable player local to avoid conflits with the rest of the code
    local player = Player(playerId)
    local party = player:getParty()

    -- better naming for variables
    for _, members in pairs(party:getMembers()) do
        if members == Player(membername) then
            party:removeMember(Player(membername))

            --stop the loop when the player to remove is found
            return
        end
    end
end
