#!/bin/bash

# Step 1: Initialize git repo
git init

# Step 2: Create folder structure
mkdir -p project_kisan/{lib,assets/images,assets/audio,functions,test,docs}

# Step 3: Create README
cat <<EOL > README.md
# Project Kisan 🌾

Project Kisan is a voice-first, AI-powered assistant designed for small-scale farmers. It provides crop disease diagnosis, price forecasting, and government scheme navigation using Google Cloud's Vertex AI and Firebase.

## Tech Stack
- Flutter (Frontend)
- Firebase (Auth, Firestore, Functions, FCM)
- Google Vertex AI (Gemini, Forecasting, STT/TTS, Agent Builder)

## Team NeuroSage | Hack2Skill | Agentic AI Day 2025 🚀
EOL

# Step 4: Create .gitignore for Flutter + Firebase
cat <<EOL > .gitignore
# Flutter/Dart
.dart_tool/
.packages
build/
.idea/
.flutter-plugins
.flutter-plugins-dependencies
.pub-cache/
pubspec.lock

# Firebase
firebase-debug.log
.env
.env.local
functions/node_modules/

# Others
*.log
*.DS_Store
EOL

# Step 5: Initial commit
git add .
git commit -m "Initial commit for Project Kisan - MVP scaffold"

# Step 6 (optional): Add remote origin (replace with your GitHub repo URL)
# git remote add origin https://github.com/yourusername/project_kisan.git
# git push -u origin main

echo "✅ Project Kisan Git repo initialized!"
