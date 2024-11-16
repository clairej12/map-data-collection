#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

# Name of the virtual environment
ENV_NAME="mapdata"

# Path to requirements file (default to requirements.txt in the current directory)
REQUIREMENTS_FILE="requirements.txt"

# Check if Python is installed
if ! command -v python3 &> /dev/null
then
    echo "Python3 could not be found. Please install Python 3.6+."
    exit 1
fi

# Create the virtual environment
echo "Creating Python virtual environment: $ENV_NAME"
python3 -m venv "$ENV_NAME"

# Activate the environment
echo "Activating Python virtual environment: $ENV_NAME"
source "$ENV_NAME/bin/activate"

# Upgrade pip
echo "Upgrading pip"
pip install --upgrade pip

# Install dependencies from requirements.txt
if [ -f "$REQUIREMENTS_FILE" ]; then
    echo "Installing dependencies from $REQUIREMENTS_FILE"
    pip install -r "$REQUIREMENTS_FILE"
else
    echo "Requirements file $REQUIREMENTS_FILE not found."
    exit 1
fi

echo "Python virtual environment $ENV_NAME setup complete and dependencies installed."
source $ENV_NAME/bin/activate