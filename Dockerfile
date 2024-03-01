# syntax=docker/dockerfile:1

FROM debian:bookworm-slim
WORKDIR /app
RUN chown 6969:6969 /app
CMD ["servers/dayz-server/DayZServer -config=serverDZ.cfg -port=2301 -BEpath=battleye -profiles=profiles -dologs -adminlog -netlog -freezecheck"]
EXPOSE 2301


# Download SteamCMD
RUN apt update
RUN apt install -y lib32gcc-12-dev lib32gcc-s1 curl
RUN mkdir -p /servers/steamcmd && cd /servers/steamcmd && curl -sqL "https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz" | tar zxvf -
#RUN chown -R 6969:6969 /app
#USER 6969:6969


# Download DayZ Server
RUN /servers/steamcmd/steamcmd.sh +force_install_dir /app/servers/dayz-server/ +set_steam_guard_code V9DWW +login serveradmin43 nqdcxr2XRp53itHVLStV2nPL5rPQe5yJ +app_update 223350 +quit
COPY serverDZ.cfg /servers/dayz-server/

