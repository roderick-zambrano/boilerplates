# bash

General scripting and notes on shell behavior or considerations.

## Mounting Drives

When an additional drive is added, it needs to be formatted appropriately and then it can be mounted. For this mount to persist after a reboot, the /etc/fstab file has to be set. After making sure that the directory being mounted to exists, add the new drive to the fstab file so that it is mounted again automatically on reboot.

## Scheduling CLI

Commands can be scheduled by using the `at` command. Writing `at` and one of the accepted date or time formats will open the interactive terminal where a command can be written. To submit the command for scheduling, you must exit the interactive terminal with CTRL+D. Scheduled job queue can be viewed with `atq`.
