# VaultWarden

## Requirements

## Setup

Customize the compose file to your liking with your respective values.

## Configuration

After spinning the container for the first time, you need to immediately access the admin console to set up the admin account for the first time. **If you do not do this, you risk anyone with access to that instance of VaultWarden to take control over the entire service**.

To access the admin account, go to the `domain.name/admin` page.

In the admin page, you can configure various values from the GUI (see console WARNING for more information). It is recommended to configure all of them through the GUI as opposed to having them as hardcoded environment variables, given the fact that they collide and overwrite any config set from the GUI.

## Notes

