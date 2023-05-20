# Wireguard Container

## Notes

The Wireguard container is set up to host a Wireguard VPN on the server side to which Wireguard clients can connect.

`CAP_ADD` adds `NET_ADMIN` and `SYS_MODULE` capabilities. Besides this, an installation of `kmod-wireguard` might be necessary on CentOS-based systems. This allows the `/lib/modules` bind to successfully use the wireguard module.

The server URL should point to the host machine's IP or to the relevant domainname.

After successfully starting the container, user configurations for the set number of `PEERS` will be generated. These configurations need to be sent to the respective users for them to place in their `/etc/wireguard` directories, under the name `wg0.conf`.

Peers will also require to install their respective Wireguard client-side application, in the case of Debian systems, the following should work:

```bash
sudo apt-get install wireguard resolvconf # resolvconf helps with domain name resolutions
```

## Usage

Once the Wireguard container or application is running successfully on the server, clients simply have to make use of the following command:

```bash
wg-quick up wg0
````

This activates the VPN and traffic will be routed through the server. The status of the connection can be monitored with the following command:

```bash
sudo wg # wg requires elevated privileges to evaluate
```

To disable the VPN, simply run the following command:

```bash
wg-quick down wg0
```

Besides the CLI interactions, an official GUI application for mainstream operating systems exists. It only needs to be provided with a configuration file for it to connect to the containerized wireguard instance.

## Troubleshooting

It is possible that the Wireguard client on some Linux distros might present issues. One of the solutions is to change the `wg0.conf` file on the client to reduce the MTUs and add certain iptables rules. The one that works for me is a simple reset of the wireguard service, with the following command:

```bash
sudo systemctl restart wg-quick@wg0.service
```

In respect to the container, since wireguard is not designed to natively run in a containerized environment, some updates might break its functionality. In cases like these, it is advised to use the `legacy` tag of the container until it is fixed.
