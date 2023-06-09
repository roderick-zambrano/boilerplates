#!/bin/bash

# A copy of this file exists in /etc/cron for easier access from root user.

# Facilitating location variables, absolute paths
root_folder=/var/lib/docker/volumes/spigot_minecraft_data/_data
destination=$root_folder/backups/

# Using -C parameter of tar, simply specify relative paths to save
world=world/
nether=world_nether/
end=world_the_end/

# Filename generated based on absolute path and current datetime
filename="$destination"`date +%Y%m%d-%H%M%S`".tar.bz2"

success=false
# Create zipped tar in backups folder. If fail because write lock, retry until success.
while [ $success = false ]; do
  BZIP2=-9 tar icjf $filename -C $root_folder $world $nether $end
  if [ $? -eq 0 ]; then
    success=true
  fi
done
