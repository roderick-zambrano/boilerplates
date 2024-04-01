# Ntfy

## Configuration

To have more control over access to the Ntfy server, a server.yml file should be configured. The example configuration provided is very complete and well documented.


## Commands

There are multiple commands that are used to manage users, tiers, permissons, among other things.

An example of a Ntfy tier is the following:

```
ntfy tier add \
  --name="super" \
  --message-limit=10000 \
  --message-expiry-duration=24h \
  --email-limit=0 \
  --call-limit=0 \
  --reservation-limit=30 \
  --attachment-file-size-limit=5G \
  --attachment-total-size-limit=20G \
  --attachment-expiry-duration=24h \
  --attachment-bandwidth-limit=5G \
  super
```

The following command changes the role of a user from "user" to "admin"
```ntfy user change-role username admin```

At the moment, it seems like only Admins are capable of reserving topics, unless a specific configuration is required that is not yet evident. Admins have read and write access to every topic by default however, regardless of other reservations.
