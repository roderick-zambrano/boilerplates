# Passbolt

## Requirements

## Setup

This setup includes SMTP Email setup and GPG key setup. The majority of these are straightforward environment variables, but some require additional setup beforehand.

### GPG Setup

1. Create or use existing GPG keys (public/private)
2. Copy and import the GPG keys in a way that the container has access to them
3. Set the variables for the fingerprint and keys

## Configuration

### User Creation


An admin user has to be created. This can be done by dropping into the shell. If signups are disabled,execute the following command:

```
su -s /bin/bash -c "./bin/cake passbolt register_user \
-u email@domain.com \
-f FirstName \
-l LastName \
-r admin" www-data
```

### Healtcheck

A healthcheck can be performed in the shell of the Passbolt container through the following command:

```
su -s /bin/bash -c "./bin/cake passbolt healthcheck" www-data
```

For the JWT FAIL, run the following command:

```
sudo su -s /bin/bash -c "/usr/share/php/passbolt/bin/cake passbolt create_jwt_keys" www-data
```

Make sure they have the adequate r/w permissions.
```
chown -Rf root:www-data /etc/passbolt/jwt/
chmod 750 /etc/passbolt/jwt/
chmod 640 /etc/passbolt/jwt/jwt.key
chmod 640 /etc/passbolt/jwt/jwt.pem
```

Follow any instructions in failing tests to get Passbolt fully functional without major issue. Most which aren't listed here are due to them having commands recommended by the healthcheck itself, although with adequately set environment variables as are listed in the project's repository much of the difficulties in the setup disappear.

### Email

Inside a shell within the passbolt container, use the following command to test the email functionality:

```
su -s /bin/bash -c "./bin/cake passbolt send_test_email --recipient=email@domain.com" www-data
```

If there exist any generated emails that remain unsent in the queue, the following command can be executed:

```
./bin/cake EmailQueue.sender
```

### Cleanup

```
./bin/cake passbolt cleanup
```

## Notes

The Windows Passbolt desktop application may have an issue in which credentials handled by the Credential Manager do not allow resetting the application. Simply open the Credential Manager, find the account-metadata, account-secret, and configuration entries and delete them. It should reset the application and allow you to sign in again.
