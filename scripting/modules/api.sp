static GlobalForward g_onRoundRespawn = null;

void Api_Create() {
    g_onRoundRespawn = new GlobalForward("OnRoundRespawn", ET_Ignore);
}

void Api_Destroy() {
    delete g_onRoundRespawn;
}

void Api_OnRoundRespawn() {
    Call_StartForward(g_onRoundRespawn);
    Call_Finish();
}
