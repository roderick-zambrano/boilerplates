# Stalwart Mail

## Requirements

1. Own domain
2. DNS records
3. SSL

## Setup

1. Set up the config file
2. Launch the container and login with admin credentials
3. Create a domain, set up DNS records listed
4. Create desired email accounts (user/service)

## Configuration

## Notes

After creating an account, if certificates are invalid, it is possible to still use it. Without proper TLS configuration, you can still use port 143 for Inbound and 587 for outbound, both with STARTTLS setting enabled. The only issue is that with invalid certificates come risks.

You can also simply set the ACME Providers which are straightforward enough in the Web Admin UI.

If you have a reverse proxy, a more complex setup may be required. Thankfully, Stalwart configuration can make use of default certificate configuration and macro use to point to local certificates on the machine, which could be provided by letsencrypt through your reverse proxy of choice. Simply add this to the configuration file:

```
[certificate."default"]
cert = "%{file:/path/to/fullchain.pem}%"
private-key = "%{file:/path/to/privkey.pem}%"
```
