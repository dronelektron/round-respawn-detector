# Round respawn detector

Allows you to detect round respawn:

1. `OnRoundRespawn` (this is a new forward)
2. `player_spawn` event (called for each player)
3. `dod_round_start` event

### Supported Games

* Day of Defeat: Source

### Installation

* Download latest [release](https://github.com/dronelektron/round-respawn-detector/releases) (compiled for SourceMod 1.11)
* Extract "plugins" and "gamedata" folders to "addons/sourcemod" folder of your server

### API

Called before clearing the map and respawning players

```
forward void OnRoundRespawn();
```

### Usage example

```
#include <sourcemod>

#define ROUND_RESPAWN_DETECTOR "round-respawn-detector"

public Plugin myinfo = {
    name = "Round respawn notifier",
    author = "Dron-elektron",
    description = "Prints a message to all players about the round respawn",
    version = "",
    url = ""
};

public void OnAllPluginsLoaded() {
    if (!LibraryExists(ROUND_RESPAWN_DETECTOR)) {
        SetFailState("Library '%s' is not found", ROUND_RESPAWN_DETECTOR);
    }
}

public void OnRoundRespawn() {
    PrintToChatAll("Round respawn");
}
```
