FROM registry.gitlab.com/minetest/minetest/server:latest

RUN apt-get update && apt-get install -y python3

ENV MINETEST_SERVER_PORT=30000
ENV MINETEST_WORLD_NAME=world

EXPOSE 30000/udp
EXPOSE 10000/tcp

COPY start.sh /start.sh
RUN chmod +x /start.sh

CMD ["/bin/bash", "/start.sh"]