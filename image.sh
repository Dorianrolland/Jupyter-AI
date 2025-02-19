#!/bin/bash
#docker build -t new-version .
docker run -it --rm -p 11434:11434 -p 8888:8888 -v $HOME:/home/test --name jupyter-container new-version
# Attendre que le conteneur soit bien lancé
until docker ps | grep -q jupyter-container; do
  sleep 5
done
# Ouvrir JupyterLab dans le navigateur une fois que le conteneur est lancé
xdg-open http://127.0.0.1:8888/lab
