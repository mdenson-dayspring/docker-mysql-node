## Structure

1. `.env` file defines environment variables for MySql
2. Database setup and fixtures in `/docker/mysql/docker-entrypoint-initdb.d`
3. Javascript project in `/src` (This is where package.json goes and other js/ts code.)
4. Hello World express app is in `index.js`

## Start Instructions with logging

1. `make up-debug` (logs for both mysql and server will output on stdout)
2. When finished Ctrl-c
3. `make down`

## Start Instructions without logging

1. `make up`
2. `make down`
