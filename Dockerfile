# syntax=docker/dockerfile:1

FROM eclipse-temurin:17-jdk

LABEL version="1.11.1"
LABEL homepage.group=Minecraft
LABEL homepage.name="FTB Inferno"
LABEL homepage.icon="https://cdn.feed-the-beast.com/blob/37/37cf12313b5169984530dd99354fe574281c69a9c21d3e37f879ce1a628d199d.png"
LABEL homepage.widget.type=minecraft
LABEL homepage.widget.url=udp://FTBInferno:25565


RUN apt-get update && apt-get install -y curl && \
 adduser --uid 99 --gid 100 --home /data --disabled-password minecraft

COPY launch.sh /launch.sh
RUN chmod +x /launch.sh

USER minecraft

VOLUME /data
WORKDIR /data

EXPOSE 25565/tcp

ENV MOTD="FTB Inferno v1.11.1 Server Powered by Docker"
ENV LEVEL=world
ENV JVM_OPTS="-Xms4096m -Xmx6144m"

CMD ["/launch.sh"]