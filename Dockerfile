FROM registry.gitlab.com/minetest/minetest/server:latest

# Install Python (Alpine)
RUN apk add --no-cache python3

# Environment variables
ENV MINETEST_SERVER_PORT=30000
ENV MINETEST_WORLD_NAME=world
ENV HTTP_PORT=10000

# Expose ports
EXPOSE 30000/udp
EXPOSE 10000/tcp

# Copy start script
COPY start.sh /start.sh
RUN chmod +x /start.sh

# Start
CMD ["/bin/sh", "/start.sh"]