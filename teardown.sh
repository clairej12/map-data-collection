#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

# Name of the virtual environment
ENV_NAME="mapdata"

# Check if the environment directory exists
if [ -d "$ENV_NAME" ]; then
    echo "Deactivating and removing Python virtual environment: $ENV_NAME"
    
    # Deactivate the environment if it's active
    if [[ "$VIRTUAL_ENV" == "$(pwd)/$ENV_NAME" ]]; then
        deactivate
    fi

    # Remove the virtual environment directory
    rm -rf "$ENV_NAME"
    echo "Python virtual environment $ENV_NAME has been deleted."
else
    echo "No virtual environment named $ENV_NAME found in the current directory."
fi
