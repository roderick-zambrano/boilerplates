# Open Project

## Requirements

## Setup

This setup assumed the all-in-one container vesion of Open Project.

Upon initial launch, log into the admin account with admin as a password and change the admin password immediately.

## Configuration

Create a secret with the following command:

```
head /dev/urandom | tr -dc A-Za-z0-9 | head -c 32 ; echo ''
```

## Notes

It seems that a working SMTP service is required to create users due to their activation codes being sent through email notifications. It seems that an admin creating a user and assigning a password trigger activation manually, but sending an invite does require working SMTP configuration.
