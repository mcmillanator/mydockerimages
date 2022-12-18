#!/bin/sh

# Set environment variables
FOUNDRY_VTT_DIR="/opt/foundryvtt"
FOUNDRY_VTT_DATA_DIR="/data/foundryvtt"
FOUNDRY_VTT_PORT=30000

# Create data directories if they do not exist
mkdir -p ${FOUNDRY_VTT_DATA_DIR}/Config
mkdir -p ${FOUNDRY_VTT_DATA_DIR}/Data

# Set permissions on data directories
chown -R node:node ${FOUNDRY_VTT_DATA_DIR}

# Start Foundry VTT
cd ${FOUNDRY_VTT_DIR}
su node -c "node ./resources/app/main.js --dataPath=${FOUNDRY_VTT_DATA_DIR} --port=${FOUNDRY_VTT_PORT}"
