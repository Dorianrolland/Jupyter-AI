# Utiliser une image de base Ubuntu
FROM ubuntu:latest

# Installer les dépendances nécessaires
RUN apt-get update && apt-get install -y \
    vim \
    python3 \
    python3-pip \
    python3-venv \
    fontconfig \
    curl 

# Installer Ollama
RUN curl -fsSL https://ollama.com/install.sh | sh

# Ajouter Ollama au PATH
ENV PATH="/root/.ollama/bin:$PATH"

# Démarrer Ollama en arrière-plan et attendre qu'il soit prêt
RUN ollama serve & \
    sleep 5 && \
    ollama pull mistral

# Créer un environnement virtuel Python et installer JupyterLab et Jupyter AI
RUN python3 -m venv /opt/venv && \
    /opt/venv/bin/pip install --upgrade pip && \
    /opt/venv/bin/pip install \
    jupyterlab \
    'jupyter-ai[all]'

# Ajouter l'environnement virtuel au PATH
ENV PATH="/opt/venv/bin:$PATH"

# Définir le répertoire de travail
WORKDIR /home

# Copier le script de démarrage de JupyterLab
COPY start-jupyter.sh .

# Exposer les ports nécessaires
EXPOSE 11434 8888

CMD ["bash"]

