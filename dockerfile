FROM python:3.11-slim

# Copy UV from the official image
COPY --from=ghcr.io/astral-sh/uv:latest /uv /uvx /bin/

# Install nginx to handle port forwarding
RUN apt-get update && apt-get install -y nginx

WORKDIR /app

COPY pyproject.toml ./
COPY uv.lock ./

# Create uploads directory
RUN mkdir -p /app/uploads

# Install dependencies using uv sync
RUN --mount=type=cache,target=/root/.cache/uv \
    uv sync --no-install-project

# Copy application files
COPY server.py client.py ./

# Install the project itself using uv sync
RUN --mount=type=cache,target=/root/.cache/uv \
    uv sync

# Create nginx configuration
RUN echo 'server { \
    listen 80; \
    location / { \
        proxy_pass http://localhost:8501; \
        proxy_http_version 1.1; \
        proxy_set_header Upgrade $http_upgrade; \
        proxy_set_header Connection "upgrade"; \
        proxy_set_header Host $host; \
    } \
    location /api/ { \
        proxy_pass http://localhost:8088/; \
        proxy_set_header Host $host; \
    } \
}' > /etc/nginx/sites-available/default

# Create startup script
RUN echo '#!/bin/bash \n\
uv run server.py & \
uv run streamlit run client.py --server.port=8501 --server.address=127.0.0.1 & \
nginx -g "daemon off;"' > /app/start.sh && chmod +x /app/start.sh

# Expose port 80 for Nginx
EXPOSE 80

# Run the start script
CMD ["/app/start.sh"]