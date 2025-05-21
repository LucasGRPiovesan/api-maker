# ⚙️ API Generator CLI (WIP)

This project is a **CLI tool for automatically generating REST APIs** using Bash scripts.

Its purpose is to **bootstrap a clean and structured API** with minimal setup. It helps save time by generating boilerplate code, folders, files, and configurations typically needed when starting a new project.

> 🚧 **This project is still a work in progress.** Expect missing features, and breaking changes.


## 🌐 Multilanguage Ecosystem Support (Coming Soon)

Although this project currently generates **Node.js**-based APIs, the goal is to **support major API ecosystems**, including:

- 🟨 **JavaScript/Node.js**
- ☕ **Java (Spring Boot)**
- 🐍 **Python (FastAPI, Flask)**
- 🐘 **PHP (Lumen, Slim)**

> Future versions will allow you to select the language stack during project initialization.


## ✨ Features

- ✅ Command-line interface with interactive prompts
- ✅ Automatic folder structure generation (`src/` with subfolders)
- ✅ Basic server setup
- ✅ Auto-generated files (README, Dockerfile, etc.)
- ✅ Option-based setup (`basic::js`, `complete::js`)
- 🚧 Multi-language support (planned)


## 🚀 Usage
```bash
bash ./init.sh
```

<pre> 
// basic::js

your-named-app/
└── src/ 
    ├── routes/ 
    │ └── index.js 
    ├── controllers/ 
    ├── services/ 
    ├── middlewares/  
├── app.js
├── .env
├── .env.example
├── .gitignore
├── Dockerfile
├── docker-compose.yml
├── docker-compose.override.yml
├── docker-compose.override.example.yml 
├── package.json 
├── README.md  
</pre>


## Follow the prompts to:
- Name your project
- Choose the setup level (e.g., Basic)
- Generate the project scaffold

## 🗺️ Roadmap
- Basic API structure
- Environment configuration with .env
- Database integration (e.g., MySQL, MongoDB)
- Docker support
- API versioning
- CLI argument support (non-interactive mode)

