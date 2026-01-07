#!/bin/bash

set -euo pipefail

# Usage
if [[ $# -lt 2 ]]; then
    echo "Usage: $0 <ENV> <ENV_FILE>"
    echo "Example: $0 staging ./secrets.env"
    exit 1
fi

ENV=$1
ENV_FILE=$2

# Normalize environment variable to uppercase
ENV_UPPER=$(echo "$ENV" | tr '[:lower:]' '[:upper:]')

if [[ ! -f "$ENV_FILE" ]]; then
    echo "Error: Environment file '$ENV_FILE' not found."
    exit 1
fi

echo "Loading environment variables for: $ENV_UPPER from $ENV_FILE"

# Filter and export relevant lines
while IFS= read -r line; do
    if [[ "$line" == "$ENV_UPPER"* ]]; then
        var_name=$(echo "$line" | cut -d '=' -f 1 | sed "s/^${ENV_UPPER}_//")
        var_value=$(echo "$line" | cut -d '=' -f 2-)
        export "$var_name=$var_value"
        echo "Exported $var_name"
    fi
done < "$ENV_FILE"
