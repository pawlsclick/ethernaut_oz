#!/bin/bash

# Path to the constants.js file
CONSTANTS_FILE="./client/src/constants.js"

# Comment out all ACTIVE_NETWORK lines first
sed -i \\
    -e "/export const ACTIVE_NETWORK = / s/^/\\/\\//"
    "$CONSTANTS_FILE"

echo "All ACTIVE_NETWORK lines commented out in $CONSTANTS_FILE"
