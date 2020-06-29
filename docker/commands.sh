# Docker Internal IP for each service
docker inspect --format='{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' <container-name>
docker inspect -f '{{.State.Running}}' <container-name>

# stop, build, start, silently
docker-compose down && docker-compose up --build -d

# Internal Hosts
docker-compose exec <container-name> cat /etc/hosts

# Environment Variable
docker-compose exec <container-name> printenv <ENV_VAR>

# Down, Build, Start, Silently
docker-compose down && docker-compose up --build -d

# Log with tail and last lines
docker-compose logs --tail=1000 -f <container-name>

# Get Al Hosts from a Container
cat $(docker inspect <container-name> | jq -r '.[] | .HostsPath')

# CURL without Proxy
curl --noproxy "*" http://0.0.0.0:0000

# Restart
sudo service docker restart
