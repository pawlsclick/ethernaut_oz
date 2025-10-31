#!/bin/bash

# Path to the constants.js file
CONSTANTS_FILE="./client/src/constants.js"

# Comment out all ACTIVE_NETWORK lines first
bash ./comment_active_network.sh

# Uncomment and set ACTIVE_NETWORK to NETWORKS.LOCAL
sed -i \\
    -e "s/\\/\\/ export const ACTIVE_NETWORK = NETWORKS.LOCAL/export const ACTIVE_NETWORK = NETWORKS.LOCAL/"
    "$CONSTANTS_FILE"

echo "ACTIVE_NETWORK set to NETWORKS.LOCAL in $CONSTANTS_FILE"

