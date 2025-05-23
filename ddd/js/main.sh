#!/bin/bash

project_name=$1

# Get the absolute path to the directory where basic.sh is located
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "Building basic architecture..."

# Create the project directory if it doesn't exist
mkdir -p "$project_name"

mkdir -p "$project_name/src"
mkdir -p "$project_name/src/core"
mkdir -p "$project_name/src/core/profile"
mkdir -p "$project_name/src/core/profile/dtos"
mkdir -p "$project_name/src/core/profile/entities"
mkdir -p "$project_name/src/core/profile/repositories"
mkdir -p "$project_name/src/core/profile/use-cases"
mkdir -p "$project_name/src/core/user"
mkdir -p "$project_name/src/core/user/dtos"
mkdir -p "$project_name/src/core/user/entities"
mkdir -p "$project_name/src/core/user/repositories"
mkdir -p "$project_name/src/core/user/use-cases"

mkdir -p "$project_name/src/infra"
mkdir -p "$project_name/src/infra/auth"
mkdir -p "$project_name/src/infra/http"
mkdir -p "$project_name/src/infra/http/controllers"
mkdir -p "$project_name/src/infra/http/middlewares"
mkdir -p "$project_name/src/infra/http/routes"
mkdir -p "$project_name/src/infra/repositories"

mkdir -p "$project_name/src/shared"

mkdir -p "$project_name/tests"
mkdir -p "$project_name/tests/__mocks__"
mkdir -p "$project_name/tests/use-cases"

# Run containerization.sh from the same directory as this script
# chmod +x "$SCRIPT_DIR/containerization.sh"
# "$SCRIPT_DIR/containerization.sh" "$project_name"

# Run containerization.sh from the same directory as this script
# chmod +x "$SCRIPT_DIR/git.sh"
# "$SCRIPT_DIR/git.sh" "$project_name"

# Run readme.sh from the same directory as this script
# chmod +x "$SCRIPT_DIR/readme.sh"
# "$SCRIPT_DIR/readme.sh" "$project_name"
