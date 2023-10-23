#!/bin/bash
docker-compose run -d --name forgeserver forgeserver
docker exec -it forgeserver bash -c "cd /srv/forge && ./run.sh"
