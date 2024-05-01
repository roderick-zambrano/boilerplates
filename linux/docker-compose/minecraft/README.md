# Minecraft

For more infromation, refer to the documentation for the `itzg/minecraft-server` container.

## Requirements

- Database (optional)
- Accept EULA (found in file eula.txt in data volume)

## Setup

The image used for the vanilla and the spigot containers is the same. For non-vanilla version games, a `TYPE` environment variable is required. In the Spigot instance, this tanslates to `TYPE="SPIGOT"`.

If there are version issues due to an image update, the `stable` tag might be helpful instead of the `latest` one. If there is an error specifying a Java version, simply use the respective `javaXX` tag.

If you're having read/write issues in the volume, make sure that the volume permissions are set to PUID=1000 and PGID=1000. After all, those are the respective permissions used by the container.

The settings on this configuration allow for the creation of a simple Minecraft stack with persistent storage of a session as quick as possible.

## Configuration

Check the `server.properties` file for more granular configuration options. By default, you must accept the EULA yourself by going to the eula.txt file and giving it a `true` value.

For plugins with their own configuration files: See plugin documentation.

## Notes

The rcon-cli terminal can be accessed by dropping into the shell and running the `rcon-cli` command.

To give a player OP status, use the `rcon-cli` command and write `op [username]` to grant them Admin control.
To disable Mojang account validation, navigate to the volume where the respective container's data is stored and change the `server.properties` file. The `online-mode` flag must be set to `false`.
Disabling `online-mode` will disable loading of skins tied to an official Minecraft account. Vanilla Minecraft has no meaningful solution for this issue.
If the server is exposed to the internet, enabling Whitlisting allows for trusted and returning users to join while keeping out any scanner users trying to access any exposed and unrestricted Minecraft servers. This however does not limit malicious actors from impersonating any user already whitelisted in the server, so keep regular backups of your worlds/relevant data and do not leave any users with `OP` privileges even if they're offline. This limits the damage a malicious actor could inflict upon a server, which a public, `online-mode: false` server is very vulnerable to without further access measures (VPN, IP blocking, etc).

### Spigot

In the Spigot version, it is possible to use the `SkinRestorer` plugin by downloading the official Spigot plugin jar file and placing it under the `plugins` folder inside of the respective mapped container volume. This enables correct Minecraft skins for all users regardless of the `online-mode` flag being set to `false`. After placing the jar, restart the server for changes to take effect.
Additionally, it is possible to use SPIGET to download plugins upon container startup rather than manually downloading them. However, not all plugins can be downloaded in this way, and some will still require manually adding the .jar file into the plugins folder inside the container's storage volume.
