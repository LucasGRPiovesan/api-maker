#!/bin/bash

project_name=$1

# Get the absolute path of this script (readme.sh)
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Full path to the project folder
project_path="$SCRIPT_DIR/../../$project_name"

# Ensure the project directory exists
mkdir -p "$project_path"

# Create README.md inside the project folder
cat <<EOF > "$project_path/.gitignore"
.env
node_modules

docker-compose.override.yml
EOF