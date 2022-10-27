# Minecraft

For more infromation, refer to the documentation for the `itzg/minecraft-server` container.

## Image

The image used for the vanilla and the spigot containers is the same. For non-vanilla version games, a `TYPE` environment variable is required. In the Spigot instance, this tanslates to `TYPE="SPIGOT"`.

The settings on this configuration allow for the creation of a simple Minecraft stack with persistent storage of a session as quick as possible.

## Server Configurations

To disable Mojang account validation, navigate to the volume where the respective container's data is stored and change the `server.properties` file. The `online-mode` flag must be set to `false`.

## Skins
Disabling `online-mode` will disable loading of skins tied to an official Minecraft account. Vanilla Minecraft has no meaningful solution for this issue.
In the Spigot version, it is possible to use the `SkinRestorer` plugin by downloading the official Spigot plugin jar file and placing it under the `plugins` folder inside of the respective mapped container volume. This enables correct Minecraft skins for all users regardless of the `online-mode` flag being set to `false`. After placing the jar, restart the server for changes to take effect.
