# Cloudflare-DDNS

Simple Cloudflare DDNS service to update CNAME records in Cloudflare

## Requirements

- Cloudflare account
  - Email
  - App API Token
  - Global API Key
  - Domain name
- Config file

## Setup

All that is required is a `config.json` file mounted at the root directory of the container. The format is found in the following section.

Note: The token permissions on Cloudflare should be `All zones - Zone Settings:Read, Zone:Read, DNS:Edit` for the DDNS update to work.

Subdomains should include a list of all subdomains that should be redirected to the target IP, which can be proxied through Cloudflare through the "proxied" parameter.

## Configuration

The "config.json" file must be in the following format, with the respective information:

```
{
  "cloudflare": [
    {
      "authentication": {
        "api_token": "CloudflareAPIToken",
        "api_key": {
          "api_key": "GlobalAPIKeyForAccount",
          "account_email": "email@example.com"
        }
      },
      "zone_id": "ZoneIdOfTargetDomain",
      "subdomains": [
        {
          "name": "",
          "proxied": false
        }
      ]
    }
  ],
  "a": true,
  "aaaa": true,
  "purgeUnkownRecords": false,
  "ttl": 3600
}
```

Due to limitations (or a lack of knowledge on how to map root directory) regarding volumes, an external volume was created to host the config file, which is meant to be found in the root directory of the container. This is why a `bind` mount is used, to copy the details of the externally-defined config.json file into the container.
