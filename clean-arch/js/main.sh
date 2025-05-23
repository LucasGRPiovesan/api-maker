#!/bin/bash

project_name=$1

# Get the absolute path to the directory where this script is located
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "Building Clean Architecture structure..."

# Create the project directory if it doesn't exist
mkdir -p "$project_name"

# === Domain Layer ===
mkdir -p "$project_name/src/domain/profile/entities"
mkdir -p "$project_name/src/domain/profile/repositories"
mkdir -p "$project_name/src/domain/user/entities"
mkdir -p "$project_name/src/domain/user/repositories"

# === Application Layer ===
mkdir -p "$project_name/src/application/profile/use-cases"
mkdir -p "$project_name/src/application/profile/dtos"
mkdir -p "$project_name/src/application/user/use-cases"
mkdir -p "$project_name/src/application/user/dtos"

# === Infrastructure Layer ===
mkdir -p "$project_name/src/infrastructure/database/repositories"
mkdir -p "$project_name/src/infrastructure/auth"
mkdir -p "$project_name/src/infrastructure/external-services"

# === Interface Layer ===
mkdir -p "$project_name/src/interfaces/http/controllers"
mkdir -p "$project_name/src/interfaces/http/middlewares"
mkdir -p "$project_name/src/interfaces/http/routes"

# === Shared ===
mkdir -p "$project_name/src/shared"

# === Tests ===
mkdir -p "$project_name/tests/__mocks__"
mkdir -p "$project_name/tests/use-cases"

# Optional: Call other setup scripts
# chmod +x "$SCRIPT_DIR/containerization.sh"
# "$SCRIPT_DIR/containerization.sh" "$project_name"

# chmod +x "$SCRIPT_DIR/git.sh"
# "$SCRIPT_DIR/git.sh" "$project_name"

# chmod +x "$SCRIPT_DIR/readme.sh"
# "$SCRIPT_DIR/readme.sh" "$project_name"
