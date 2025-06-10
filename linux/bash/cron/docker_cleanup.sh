#!/bin/bash

# A copy of this file exists in /etc/cron for easier access from root user.

printf "`date`\n`date -u`\n"
echo "Cleaning up docker system..."
# Run the native docker pruning command to clean unused networks, volumes, and images.
PRUNE_OUTPUT=$(docker system prune -f)

RECLAIMED_LINE=$(echo "$PRUNE_OUTPUT" | grep "Total reclaimed space")

RECLAIMED_SIZE=$(echo "$RECLAIMED_LINE" | sed -n 's/Total reclaimed space: //p')

# Print output for logs
echo "$PRUNE_OUTPUT"

if [ $? -eq 0 ]; then
  echo "Successfully executed script."
  curl -s -x "https://ntfy.addr" \
       -H "Authorization: Bearer tk_ntfytoken" \
       -H "Title: Docker Prune" \
       -H "Priority: low" \
       -d "Prune successful. Reclaimed $RECLAIMED_SIZE." \
       -L ntfy.addr/channel > /dev/null
  
else
  echo "Error occurred. Script execution failed."
  curl -s -x "https://ntfy.addr" \
       -H "Authorization: Bearer tk_ntfytoken" \
       -H "Title: Docker Prune" \
       -H "Priority: high" \
       -d "Error occured. Script execution failed, check logs." \
       -L ntfy.addr/channel > /dev/null
fi
