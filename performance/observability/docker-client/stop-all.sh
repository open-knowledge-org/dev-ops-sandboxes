echo -e '\e[96m-------------------------------'
echo -e '\e[96m        Stop Containers '
echo -e '\e[96m-------------------------------'
echo -e '\e[39mStop Docker Containers \n'

docker-compose down

echo -e '--------------------------------'
echo -e '        Show Docker Status'
echo -e '--------------------------------'
docker ps
