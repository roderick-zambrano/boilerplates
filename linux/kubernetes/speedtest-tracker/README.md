# Speedtest Tracker

## Requirements

- App
  - PersistentVolume/Claim
  - Setting listed ENV variables
  - Service configuration
- Database
  - PersistentVolume/Claim
  - Setting listed ENV variables
  - Service configuration

## Setup

The environment file setup deals with the majority of the work. Make sure that the necessary variables match, such as database name, user, password, etc.
After that, the services should expose the respective ports. Kubernetes DNS in the cluster should handle hostname resolution to make the database available for the tracker to read and write information to.

## Configuration

## Notes

If you want to specify which servers to run speedtests againsts, check the container's documentation.
