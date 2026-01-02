FROM debian:bookworm-slim

# Install required packages
RUN apt-get update && apt-get install -y \
  python3 \
  curl \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

# Install Minetest server
RUN curl -L https://github.com/minetest/minetest/releases/download/5.6.1/minetest-server-5.6.1-linux.tar.gz \
  | tar -xz -C /opt

ENV PATH="/opt/minetest/bin:${PATH}"
ENV MINETEST_SERVER_PORT=30000
ENV MINETEST_WORLD_NAME=world

EXPOSE 30000/udp
EXPOSE 10000/tcp

COPY start.sh /start.sh
RUN chmod +x /start.sh

CMD ["/bin/sh", "/start.sh"]