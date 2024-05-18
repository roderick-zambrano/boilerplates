# Home Assisant

## Requirements

## Setup

The initial setup of Home Assistant is relatively painless and quite straightforward. Using the example docker compose, the container spins up without major issue.

Once the container is launched successfully, access it through the port on the host machine to set up the first Admin user.

To access Home Assistant externally, you need to enable the HTTP integration, which enables serving the frontend to connections outside of the host machine. The configuration is enabled through the `configuration.yaml` file. Make sure to set up the Admin user before you expose it outside of your home network.

## Configuration

The configuration file for Home Assistant is generated automatically, but sometimes you'll need to modify it yourself to integrate some services.

### Examples

To enable the http integration in your config, write the following anywhere within it:
```
http:
  use_x_forwarded_for: true  
  trusted_proxies:
    - X.X.X.X/24
    - X.X.X.X
  ip_ban_enabled: true
```
This will enable HTTP from incoming connections within a subnet or a specific IP. Additionally, it will ban IPs and list them in a separate yaml file.

To enable the Telegram integration in your config, write the following anywhere within it:

```
telegram_bot:
  - platform: polling
    api_key: "botAPIkey"
    allowed_chat_ids:
    - 1234567890

notify:
  - platform: telegram
    name: "Human readable descriptive name (example: 'Main User 1' or 'Group 2')"
    chat_id: 123456789
```
All chat ids for receiving messages through Telegram should be included in the `allowed_chat_ids` list.


## Notes

Home Assistant is heavily documented so it's a good idea to refer to the docs for anything you want to do with it.
