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
