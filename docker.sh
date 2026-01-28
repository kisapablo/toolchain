#!/bin/bash

set -e 
echo "Installing Docker related dependencies..."

sudo dnf install docker-buildkit docker-buildx docker-cli docker-compose -y || exit 1

echo "Adding $USER to docker group..."
sudo groupadd docker || true
sudo usermod -aG docker $USER

echo "Please log out and log back in to apply the group changes."
