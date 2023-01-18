#include <sourcemod>
#include <dhooks>

#include "rrd/dynamic-hook"

#include "modules/api.sp"
#include "modules/dynamic-hook.sp"

public Plugin myinfo = {
    name = "Round respawn detector",
    author = "Dron-elektron",
    description = "Allows you to detect round respawn",
    version = "0.1.0",
    url = "https://github.com/dronelektron/round-respawn-detector"
};

public APLRes AskPluginLoad2(Handle plugin, bool late, char[] error, int errorMax) {
    RegPluginLibrary("round-respawn-detector");

    return APLRes_Success;
}

public void OnPluginStart() {
    Api_Create();
    DynamicHook_Create();
}

public void OnPluginEnd() {
    Api_Destroy();
    DynamicHook_Destroy();
}
