# Fail2Ban

## Requirements

Either or:

- Access logs
- Cloudflare Tools

## Setup

These steps presume using Fail2Ban with an instance of Nginx Proxy Manager and Cloudflare tooling.

1. Launch the container.
2. Access the volume to configure the `jail`, `filter`, and `action` for IP banning purposes.
3. In the `jail.d` directory, create a `npm-docker.local` file as described in Configuration section.
4. In the `action.d` directory, create a `cloudflare-apiv4.conf` file following the example authored by Gilbn from https://technicalramblings.com. Review and only fill in the value for `cfuser` (your Cloudflare account email) and `cftoken` (your Cloudflare Global API Key).
5. In the `filter.d` directory, create a `npm-docker.conf` file as described in the Configuration section.
6. Restart container after all these files have successfully been configured. Console should begin printing the banning of IPs.

## Configuration

Configuration for the npm-docker.local file:
```
[npm-docker]
enabled = true
ignoreip = 127.0.0.1/8 192.168.0.0/24 domain.name
action = cloudflare-apiv4
chain = INPUT
logpath = /log/npm/default-host_access.log
          /log/npm/proxy-host-*_access.log
          /log/npm/proxy-host-*_error.log
maxretry = 2
bantime = -1
findtime = 86400
```

[npm-docker]: Name of the jail.
ignoreip: IPs to be ignored from potential banning. Any IP you're using or expect to reach the server has to be included here to avoid accidental bannings.
action: Action configured in the `action.d` directory to follow after an IP finds itself in jail.
logpath: The path to the access and error logs of NPM in this case.

Configuration for the npm-docker.conf file:
```
[INCLUDES]

[Definition]

failregex = ^<HOST>.+" (4\d\d|3\d\d) (\d\d\d|\d) .+$
            ^.+ 4\d\d \d\d\d - .+ \[Client <HOST>\] \[Length .+\] ".+" .+$
```

failregex: The regex used to filter out failing requests with the IPs destined for the jail.

## Notes

This setup is based on a simple HTTP/S filter, but other filters, such as sshd, exist as well.

To view banned IPs in Cloudflare, access your account, go to your targeted domain, Security>WAF>Tools. You will see a list of the banned IPs with a description of "Fail2ban npm-docker" to signify the origin of the ban for said IP.

### Commands

To manually ban an IP, the following command can be used in the CLI:

```
fail2ban-client set JAILNAME banip xxx.xxx.xxx.xxx
```

The inverse can be achieved by using `unbanip` instead.

To show banned ips, the following command can be used in the CLI:

```
fail2ban-client banned  
```
