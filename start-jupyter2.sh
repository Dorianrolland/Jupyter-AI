#!/bin/bash

# Démarrer Ollama en arrière-plan
ollama serve &

# Attendre que Ollama soit prêt
sleep 5

# Démarrer JupyterLab
jupyter lab --ip=0.0.0.0 --port=8888 --allow-root \
   
