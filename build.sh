#!/bin/bash

PLUGIN_NAME="round-respawn-detector"

cd scripting
spcomp $PLUGIN_NAME.sp -o ../plugins/$PLUGIN_NAME.smx
