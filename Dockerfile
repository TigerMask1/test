FROM registry.gitlab.com/minetest/minetest/server:latest

ENV MINETEST_SERVER_PORT=30000
ENV MINETEST_WORLD_NAME=world

EXPOSE 30000/udp

CMD ["minetestserver", "test server", "world", "--port", "30000"]
