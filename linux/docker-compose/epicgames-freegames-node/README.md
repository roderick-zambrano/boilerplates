# EpicGames Free Games Node

## Requirements

- EpicGames account(s)
- Notification channel

## Setup

Complete the `config.json` file provided, which currently only shows a telegram notification configuration. Many other configurations exist on the original documentation to suit your needs.

## Configuration

The `config.json` file must be in the following format, with the respective information:

```
{
   "cronSchedule": "0 0,6,12,18 * * *",
  "logLevel": "info",
  "accounts": [
    {
      "email": "epicaccount@email.com"
    }
  ],
  "notifiers": [
    {
      "type": "telegram",
      "token": "########:@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@",
      "chatId": "##########"
    }
  ]
}
```

## Notes

To limit the consumption of memory, you can pass a deploy limit on memory as seen on the compose file.
