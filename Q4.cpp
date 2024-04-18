// Q4 - Assume all method calls work fine.Fix the memory leak issue in below method


void Game::addItemToPlayer(const std::string &recipient, uint16_t itemId)
{
    Player *player = g_game.getPlayerByName(recipient);

    // flag to know if player was created within th function
    bool deletePlayer = false;

    if (!player)
    {
        player = new Player(nullptr);
        // Check if player creation failed
        if (!IOLoginData::loadPlayerByName(player, recipient))
        {
            // if the player creation fails, clean the memory
            delete player;
            return;
        }
        //dynamically allocated player, then mark to delete after
        deletePlayer = true;
    }

    Item *item = Item::CreateItem(itemId);

    if (!item)
    {
        // if the player is dynamic, destroy it
        if (deletePlayer)
        {
            delete player;
        }
        return;
    }

    g_game.internalAddItem(player->getInbox(), item, INDEX_WHEREEVER, FLAG_NOLIMIT);

    if (player->isOffline())
    {
        IOLoginData::savePlayer(player);
    }

    // destroy dynamic item
    delete item;

    // Clean up the player if it is dynamic 
    if (deletePlayer)
    {
        delete player;
    }
}