# Watchtower

## Requirements

1. Docker Socket (r/w to spin containers up)

## Setup

Just run the container.

## Configuration

## Notes

Watchtower uses labels to exclude containers from being updated by it. Add the label "com.centurylinklabs.watchtower.enable=false" in the compose file of a container you wish to exclude from being updated by Watchtower.
