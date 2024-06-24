# Speedtest Tracker

## Requirements

## Setup

Fill in environment variables appropriately. This setup includes a database container to store the results.

## Configuration

Go to https://speedtest-tracker.dev to copy the randomly generated appkey. This is for the convenience of not having to generate one yourself.

## Notes

Inside of the app container, you can get a list of preferable servers by navigating to the app/www directory and running `php artisan app:ookla-list-servers`. The IDs can then be placed in the SPEEDTEST_SERVERS environment variable, separated by commas. If you want all of the IDs comma-separated from the get-go, you can run the following command chain:

```
  php artisan app:ookla-list-servers | awk 'NR > 1 {print $2}' | grep -E '^[0-9]+$' | paste -sd, -
```

Put simply, this command chain prints the table of preferable servers, then shows only the IDs, keeps numeric values only, and then delimits them by using a comma. This result includes all servers however, including those with further distances from source. Inspect it and add or remove IDs as desired.
