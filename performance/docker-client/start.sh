echo -e '\e[96m-------------------------------'
echo -e '\e[96m        Start Containers '
echo -e '\e[96m-------------------------------'
echo -e '\e[39mStart Docker Containers \n'

docker network create performance-test
docker-compose up --build -d

echo -e '--------------------------------'
echo -e '        Show Docker Status'
echo -e '--------------------------------'
docker ps
