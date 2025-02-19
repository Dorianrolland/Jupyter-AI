#!/bin/bash

# Démarrer Ollama en arrière-plan
ollama serve &

# Attendre que Ollama soit prêt
sleep 5

# Démarrer JupyterLab
jupyter lab --ip=0.0.0.0 --port=8888 --no-browser --allow-root &

# Attendre que JupyterLab soit lancé
sleep 5

# Obtenir l'URL de JupyterLab
url="http://localhost:8888/lab?token=$(jupyter server list | grep -oP '(?<=token=)[a-z0-9]{32}')"

# Ouvrir l'URL dans le navigateur (sur l'hôte)
xdg-open "$url" || echo "Ne peut pas ouvrir le navigateur, ouvrez $url manuellement"

