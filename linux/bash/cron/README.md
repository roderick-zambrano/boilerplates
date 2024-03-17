# cron

Scripts meant to be run under `cron` are stored here. No frequency information is stored within these scripts, that is defined in either the respective /etc/cron.daily, hourly, monthly, or weekly folders, or in the crontab file.

## Tips

For testing purposes, the `run-parts` command can be used to execute scripts in the same directory in sequential order. This can help in the debugging or testing of a specific script by running it as it would run when configured in cron, while printing any script feedback to the console. For more info, check documentation.
```bash
run-parts <directory>
```

## crontab

Depending on the numeric values written in the crontab file, the respective script will run on the minute, hour, day, month, and/or weekday defined. Not every value is necessary, an asterisk `*` can be provided as a placeholder in such cases where a value is not needed.
