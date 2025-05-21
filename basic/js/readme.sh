#!/bin/bash

project_name=$1

# Get the absolute path of this script (readme.sh)
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Full path to the project folder
project_path="$SCRIPT_DIR/../../$project_name"

# Ensure the project directory exists
mkdir -p "$project_path"

# Create README.md inside the project folder
cat <<EOF > "$project_path/README.md"
# $project_name

Project automatically generated with the \`init.sh\` script.

## Project Structure

- src/
  - controllers/
  - middlewares/
  - routes/
  - services/

## How to run

\`\`\`bash
npm install
npm start
\`\`\`

EOF
echo "README.md successfully created for project: $project_name."
