# Wireguard

## Requirements

1. Access to host capabilities
2. Forwarding from host
3. Configuration of peers
4. Other connectivity configurations

## Setup

Configure the docker-compose file following the example. If the wireguard kernel module is not installed on the host machine, "SYS_MODULE" needs to be include in the `cap_add`  added capabilities. This can be confirmed by running the following commands and confirming the listing of "wireguard" in the result:

```bash
sudo modprobe wireguard
lsmod | grep wireguard
```

Although optional, to install the wireguard module, find the corresponding `wireguard-tools` and/or `kmod-wireguard` for the host machine and install them, which can then be used to bind the modules as shown in the docker-compose.

After completing the docker-compose, make sure your router forwards port 51820 (udp) to the host machine, and that firewall rules allow for this. In a Linux host machine, this can usually be done with something such as:

```bash
sudo firewall-cmd --add-port=51820/udp --permanent
sudo firewall-cmd --reload
```

Make sure to do the equivalent corresponding to the host OS. After forwarding port 51820, spin up the container for the first time.

Upon first run, the container will create the amount of client configs matching the listed number of `PEERS` set. These are stored in the data volume and should be shared with unique clients, since one unique config cannot be used simultaneously by different devices, although one config can be set to multiple devices as long as only one device is actively using the unique config. The client device should use the .conf file or the .png image to configure any wireguard program as required in the documentation of each respective client wireguard program. Wireguard should work with these considerations.

Up to this point, setup only covers using the host machine as an endpoint. To route traffic to the LAN, it's required to add the following to `/etc/sysctl.conf`:
```bash
net.ipv4.ip_forward = 1
net.ipv6.conf.all.forwarding = 1
```

Some other steps are required but this is the extent of the guide to at least offer a direction.

## Configuration

## Notes

The Wireguard container is set up to host a Wireguard VPN on the server side to which Wireguard clients can connect.

`cap_add` is used to add `NET_ADMIN` and `SYS_MODULE` capabilities. Besides this, an installation of `kmod-wireguard` might be necessary on CentOS-based systems. Installing the kernel module allows the `/lib/modules` bind to successfully use the wireguard module in the host machine.
[!NOTE]
SYS_MODULE is not necessary if the wireguard kernel module is installed.

The server URL should point to the host machine's IP or to the relevant domainname.

After successfully starting the container, user configurations for the set number of `PEERS` will be generated. These configurations need to be sent to the respective users for them to place in their `/etc/wireguard` directories, under the name `wg0.conf`.

Peers will also require to install their respective Wireguard client-side application, in the case of Debian systems, the following should work:

```bash
sudo apt-get install wireguard resolvconf # resolvconf helps with domain name resolutions
```

### Usage

 Shorthand CLI commands include the following.

Starting WireGuard VPN on a configured client machine:
```bash
wg-quick up wg0
````
[!NOTE]
wg0 is the name of the configuration file on the client machine which should be located on the target wireguard configuration folderon the client. This is a parameter that can vary based on the name of the configuration file itself, which should match.

Checking WireGuard connection status:
```bash
sudo wg # wg requires elevated privileges to evaluate
```

To disable the VPN, simply run the following command:

Disabling an active WireGuard VPN connection on the client machine:
```bash
wg-quick down wg0
```

Besides the CLI interactions, an official GUI application for mainstream operating systems exists. It only needs to be provided with a configuration file for it to connect to the containerized wireguard instance. Make sure to check the tools available to figure out which is more convenient.

### Troubleshooting

It is possible that the Wireguard client on some Linux distros might present issues. One of the solutions is to change the `wg0.conf` file on the client to reduce the MTUs and add certain iptables rules. The one that works for me is a simple reset of the wireguard service, with the following command:

```bash
sudo systemctl restart wg-quick@wg0.service
```

In respect to the container, since wireguard is not designed to natively run in a containerized environment, some updates might break its functionality. In cases like these, it is advised to use the `legacy` tag of the container until it is fixed.
