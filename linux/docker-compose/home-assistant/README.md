# Home Assisant

## Requirements

 - Govee2mqtt*
   - Account
   - API key
 - Mosquitto*

*In my particular case, gove2mqtt is required to interface with currently owned Govee IoT bulbs.

## Setup

The initial setup of Home Assistant is relatively painless and quite straightforward. Using the example docker compose, the container spins up without major issue.

Once the container is launched successfully, access it through the port on the host machine to set up the first Admin user.

To access Home Assistant externally, you need to enable the HTTP integration, which enables serving the frontend to connections outside of the host machine. The configuration is enabled through the `configuration.yaml` file. Make sure to set up the Admin user before you expose it outside of your home network.

For more features, the docker-compose file for this stack includes MQTT setup. If MQTT setup is not desired, you can skip anything MQTT-related. MQTT is required by govee2mqtt, so the latter can also be ignored if it does not apply.

## Configuration

The configuration file for Home Assistant is generated automatically, but sometimes you'll need to modify it yourself to integrate some services.

### MQTT

Mosquitto automatically generates a `mosquito.conf` file. This file is large, but for the purposes of simplifying the setup, we will use a custom configuration. Feel free to save a copy of the default or refer to documentation if you need to restore the default values. Recommended basic configuration:

```
persistence true
persistence_location /mosquitto/data
user mosquitto
listener 1883
allow_anonymous false
log_dest file /mosquitto/log/mosquitto.log
log_dest stdout
```

After you run the container for the first time, drop into its shell and run the following command to create a user and give it a password (in the example, named mqtt):

```
mosquitto_passwd -c /mosquitto/config/credentials mqtt
```

This creates a password-authenticated user to access MQTT with. After this is done, append the following line to the `mosquitto.conf`:

```
password_file /mosquitto/config/credentials
```

If you add this line beforehand and the file does not already exist, mosquitto will fail to run.

After this setup, go to Home Assistant and search for the MQTT integration. Use your server's hostname due to Home Assistant and MQTT being in HOST network mode, and use the respective 1883 port with the user and password to connect to the MQTT service.

### Govee2mqtt

Due to owning Govee IoT light bulbs, a Govee2mqtt container is used alongside a Govee account and an API key to be able to interface with Govee through the Cloud. The available bulbs cannot be interfaced with LAN API due to not supporting it, which is why these are unfortunately required.

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
