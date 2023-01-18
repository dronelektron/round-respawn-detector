static Handle g_roundRespawn = null;

void DynamicHook_Create() {
    Handle gameConfig = LoadGameConfigFile(GAME_CONFIG);

    if (gameConfig != null) {
        DynamicHook_CreateRoundRespawn(gameConfig);
        DHookEnableDetour(g_roundRespawn, POST_NO, DynamicHook_RoundRespawn)
        CloseHandle(gameConfig);
    }
}

void DynamicHook_Destroy() {
    DHookDisableDetour(g_roundRespawn, POST_NO, DynamicHook_RoundRespawn)

    delete g_roundRespawn;
}

void DynamicHook_CreateRoundRespawn(Handle gameConfig) {
    g_roundRespawn = DHookCreateFromConf(gameConfig, FUNCTION_ROUND_RESPAWN);

    if (g_roundRespawn == null) {
        SetFailState("Unable to hook '%s' function", FUNCTION_ROUND_RESPAWN);
    }
}

public MRESReturn DynamicHook_RoundRespawn() {
    Api_OnRoundRespawn();

    return MRES_Ignored;
}
