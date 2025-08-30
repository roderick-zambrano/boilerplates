# Cal.com

## Requirements

## Setup

Configure all relevant environment variables in the docker-compose, replacing any example credentials with the ones meant to be used in production. Upon first run, execute the migrations with the following command:

```bash
docker exec -it calcom_container_name npx prisma migrate deploy
```

You can then access the service for the first time to create the admin user, following the instructions to complete the initial setup process.

## Configuration

## Notes

