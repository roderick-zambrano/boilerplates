# bash

General scripting and notes on shell behavior or considerations.

## Mounting Drives

When an additional drive is added, it needs to be formatted appropriately and then it can be mounted. For this mount to persist after a reboot, the /etc/fstab file has to be set. After making sure that the directory being mounted to exists, add the new drive to the fstab file so that it is mounted again automatically on reboot.

