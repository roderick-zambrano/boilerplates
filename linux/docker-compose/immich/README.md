# Immich

## Requirements

## Setup

Just run the compose file.

## Configuration

## Notes

The active development of Immich might introduce instability when it comes to updating the version. For this purpose, the `release` tag is used to avoid in part an update that would break the service. Additionally, in the case of using Watchtower, labels are added to disable updates to Immich coming from it.

Immich requires redis and database to keep those names due to them being used internally by the application, which is why the config file lists them as such.
