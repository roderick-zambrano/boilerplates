#!/bin/bash

# A copy of this file exists in /etc/cron for easier access from root user.

echo "Cleaning up docker system..."
# Run the native docker pruning command to clean unused networks, volumes, and images.
docker system prune -f
if [ $? -eq 0 ]; then
  echo "Successfully executed script."
else
  echo "Error occurred. Script execution failed."
fi
