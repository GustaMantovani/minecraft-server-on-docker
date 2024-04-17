## Minecraft Server on Docker
    
This repository was created to configure and execute a Minecraft Server using Docker, utilizing a custom image based on Arch Linux, that uses systemd to manage the services.

The motivation is to make possible to own a personal, portable and exposed on the internet Minecraft Server. For this, the chosen implementation was to run the server as a Docker Container, which allows it to be exported like a zipped container or to be exposed on the internet with ngrok, allowing any person with the link to connect. This approach brings the advantage of unlinking the world and the server from just one computer. Furthermore, the clients dont need to deal with inconveniences to connect to the server, needing only access to the internet. The host also has advantages in that regard, needing only Docker installed, without the need to deal with Java's installation.

### Project Files

1. **`docker-compose.yml`:**
    The `docker-compose.yml` file defines the Docker service configuration for the Forge Minecraft Server. It specifies the resources, like CPUs and memory, the exposed ports and the volumes built for the server. The mods volume allows the addition of mods for your world outside the Docker container. Furthermore, the configurated resources were tested and are considered as a minimum requirement for the proper functioning of the server. Any configuration bellow these parameters caused problems during the tests.

3. **`Dockerfile`:**
    The Dockerfile was built with an Arch Linux personalized image as a base. It configures and prepares the environment to execute the Minecraft server, utilizing systemd to manage the services.

4. **`install.sh`:**
    The `install.sh` script is a shell script that stars the service of the Minecraft Forge server inside a Docker container using `docker-compose`.

5. **`expose.sh`:**
    The `expose.sh` file executes the `ngrok tcp 25565` command inside the Minecraft Forge server container(`forgeserver`). This can be used to expose the local Minecraft sever through the ngrok service.

### Configuration

1. Personalize the Minecraft server configurations edditing the eula.txt and server.properties files located in the config directory.

2. In the Dockerfile, on line `RUN ngrok config add-authtoken your_token`, replace `your_token` with your ngrok token, this is crucial to expose your server beyond the local network.

## Usability

1. After initializing the server with the `start.sh` script, the port mapping will be configured so that any computer can connect to the server using the host's IP and the host's default port 25565. 

2. It is also possible to expose the server on the internet with the `expose.sh` script. After its execution, ngrok's prompt will be open, showing the sever's domain. This domain will be used for connection. In the Minecraft's connection menu, just use the information present on the "Forwarding" camp displaying on ngrok's prompt.