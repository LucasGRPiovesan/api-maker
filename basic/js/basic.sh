#!/bin/bash

project_name=$1

# Get the absolute path to the directory where basic.sh is located
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "Building basic architecture..."

# Create the project directory if it doesn't exist
mkdir -p "$project_name"

# Create README.md inside the project folder
cat <<EOF > "$project_name/package.json"
{
  "name": "$project_name",
  "version": "1.0.0",
  "description": "",
  "main": "app.js",
  "scripts": {
    "start": "node app.js",
    "dev": "nodemon app.js"
  },
  "dependencies": {
    "express": "^4.18.2"
  },
  "devDependencies": {
    "nodemon": "^2.0.22"
  },
  "author": "",
  "license": "ISC"
}
EOF

# Create README.md inside the project folder
cat <<EOF > "$project_name/app.js"
const express = require('express');
const app = express();
const routes = require('./src/routes');

// Middleware to parse JSON requests
app.use(express.json());

// Basic route
app.get('/', (req, res) => {
  res.send('Hello, world!');
});

// Use routes from routes/index.js
app.use('/', routes);

// Start the server
const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
  console.log(\`Server is running on port \${PORT}\`);
});
EOF


# Create README.md inside the project folder
cat <<EOF > "$project_name/.env"
# DATABASE
DB_HOST=db
DB_PORT=3306
DB_USERNAME=root
DB_PASSWORD=root
DB_DATABASE=dev_base
DB_DIALECT=mysql

# SERVER
PORT=3000
NODE_ENV=development
EOF

# Create README.md inside the project folder
cat <<EOF > "$project_name/.env.example"
# DATABASE
DB_HOST=
DB_PORT=
DB_USERNAME=
DB_PASSWORD=
DB_DATABASE=
DB_DIALECT=

# SERVER
PORT=
NODE_ENV=
EOF

# Create the src directory and subdirectories inside the project
mkdir -p "$project_name/src/routes"
# Create README.md inside the project folder
cat <<EOF > "$project_name/src/routes/index.js"
const express = require('express');
const router = express.Router();

// Sample route
router.get('/test', (req, res) => {
  res.send('Success!');
});

module.exports = router;
EOF

mkdir -p "$project_name/src/controllers"
mkdir -p "$project_name/src/services"
mkdir -p "$project_name/src/middlewares"

# Run containerization.sh from the same directory as this script
chmod +x "$SCRIPT_DIR/containerization.sh"
"$SCRIPT_DIR/containerization.sh" "$project_name"

# Run containerization.sh from the same directory as this script
chmod +x "$SCRIPT_DIR/git.sh"
"$SCRIPT_DIR/git.sh" "$project_name"

# Run readme.sh from the same directory as this script
chmod +x "$SCRIPT_DIR/readme.sh"
"$SCRIPT_DIR/readme.sh" "$project_name"
