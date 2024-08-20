FROM node:22-bookworm-slim

COPY index.js ./

RUN apt-get update && apt-get install -y curl
