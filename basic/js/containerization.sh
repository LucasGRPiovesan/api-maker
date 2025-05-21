#!/bin/bash

project_name=$1

# Get the absolute path of this script (readme.sh)
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Full path to the project folder
project_path="$SCRIPT_DIR/../../$project_name"

# Ensure the project directory exists
mkdir -p "$project_path"

# Create README.md inside the project folder
cat <<EOF > "$project_path/Dockerfile"
# Uses the official Node.js image
FROM node:18

# Installs the MySQL client (and clears cache afterwards)
RUN apt-get update && apt-get install -y \
  default-mysql-client \
  && rm -rf /var/lib/apt/lists/*

# Sets the working directory
WORKDIR /var/www/html

# Copies only dependency files
COPY package*.json ./

# Copies the rest of the application
COPY . .

# Exposes the application port
EXPOSE 3000

CMD ["npm", "run", "dev"]
EOF
echo "Dockerfile successfully created for project: $project_name."

# Create README.md inside the project folder
cat <<EOF > "$project_path/docker-compose.yml"
services:
  app:
    build:
      context: .
      dockerfile: Dockerfile
    container_name: node_app
    volumes:
      - .:/usr/src/app
      - /usr/src/app/node_modules
    ports:
      - "3000:3000"
    depends_on:
      - db
    environment:
      - DATABASE_URL=${DATABASE_URL}
      - NODE_ENV=development
    command: npm run dev
    env_file:
      - .env
EOF
echo "docker-compose.yml successfully created for project: $project_name."

# Create README.md inside the project folder
cat <<EOF > "$project_path/docker-compose.override.yml"
services:
  app:
    build:
      context: .
      dockerfile: Dockerfile
    container_name: node_app
    volumes:
      - .:/var/www/html
    ports:
      - "3000:3000"
    depends_on:
      - db
    environment:
      - DATABASE_URL=${DATABASE_URL}
      - NODE_ENV=development
    entrypoint: ["sh", "docker/entrypoint.sh"]
    env_file:
      - .env

  db:
    image: mysql:8.0
    container_name: db
    restart: unless-stopped
    environment:
      MYSQL_DATABASE: ${DB_DATABASE}
      MYSQL_ROOT_PASSWORD: ${DB_PASSWORD}
    ports:
      - "3306:3306"
    volumes:
      - db_data:/var/lib/mysql
    env_file:
      - .env

volumes:
  db_data:
EOF

# Create README.md inside the project folder
cat <<EOF > "$project_path/docker-compose.override.example.yml"
services:
  app:
    build:
      context: .
      dockerfile: Dockerfile
    container_name: node_app
    volumes:
      - .:/var/www/html
    ports:
      - "3000:3000"
    depends_on:
      - db
    environment:
      - DATABASE_URL=${DATABASE_URL}
      - NODE_ENV=development
    entrypoint: ["sh", "docker/entrypoint.sh"]
    env_file:
      - .env

  db:
    image: mysql:8.0
    container_name: db
    restart: unless-stopped
    environment:
      MYSQL_DATABASE: ${DB_DATABASE}
      MYSQL_ROOT_PASSWORD: ${DB_PASSWORD}
    ports:
      - "3306:3306"
    volumes:
      - db_data:/var/lib/mysql
    env_file:
      - .env

volumes:
  db_data:
EOF
