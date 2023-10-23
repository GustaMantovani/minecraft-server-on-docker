FROM gustamantovani/forgeserver:latest

EXPOSE 25565

COPY ./config/eula.txt /srv/forge
COPY ./config/server.properties /srv/forge

RUN ngrok config add-authtoken your_token

