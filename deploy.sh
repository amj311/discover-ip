#!/bin/sh

# load env vars from file if present
# Otherwise the should already be present
if [[ -f .env.deploy ]]; then
	. .env.deploy
fi

# Remove previous containers
DOCKER_HOST=ssh://${SSS_USER}@${SSH_HOST} docker-compose -f docker-compose.yml down

# Run docker compose on host, force build
DOCKER_HOST=ssh://${SSS_USER}@${SSH_HOST} docker-compose -f docker-compose.yml up -d --build

# consider running image prune here....


echo "Finished!"

exit 0