# Immich

## Requirements

1. Set environment variables as shown in original docker compose

## Setup

Just run the compose file.

## Configuration

## Notes

The active development of Immich might introduce instability when it comes to updating the version. For this purpose, the `release` tag is used to avoid in part an update that would break the service. Additionally, in the case of using Watchtower, labels are added to disable updates to Immich coming from it.

Immich requires redis and database to keep those names due to them being used internally by the application, which is why the config file lists them as such.

## Troubleshooting

It is possible that upon server crash the immich server container may have issues launching until the database container performs any repair functions--this should be monitored only if an extensive amount of time passed (which can vary based on amount of data stored) without successful container launch. It should not be cause of concern for the most part.

Although not explicitly documented, the core service and the postgres database may have issues if the core service cannot correctly find a route to the database. A solution for this was to include the variable `DB_HOSTNAME` pointing to the hostname of the postgres instance for the core service to be able to reach it and not have authentication failures due to host issues.
