Redis Server (expposed port: 6379)
```
docker-compose up --build -d
```

Redis Client
If you need to check the current messages on Redis, it could be used the redis-commander.
```
npm install -g redis-commander
redis-commander --port 5000
```
