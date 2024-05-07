# JupyterHub

## Requirements

## Setup

1. Run the container for the first time.
2. Drop into a shell to the `/etc/jupyterhub` directory and run the command
```
jupyterhub --generate-config
```
3. Inspect and edit the resulting `jupyterhub_config.py` as needed.
4. Install jupyter
5. Add users with the `useradd` command.

## Configuration

In the environment variables, you can set the JPY_COOKIE_SECRET by generating it with the following command:
```
openssl rand -hex 32
```

To add users to JupyterHub, you need to drop into the shell and create said user with the following command:
```
useradd -m -p $(openssl passwd -1 AccountPassword) UserToAdd
```

This will create a user with a password and its own home directory with necessary permissions.

To get a quick glance at important variables and other relevant data, run the following command:
```
jupyter troubleshoot
```

## Notes

A user needs to have a `/home` directory. Without it, even if they can log in, their server will fail to start.

If running JupyterHub behind a proxy, make sure to enable WebSocket support to enable connecting to the Kernel. Without it, the kernel status message will show "Connecting..." and most likely settle under "Disconnected". In Nginx Proxy Manager, this is a simple toggle. If the Kernel is running successfully, you will see an "Idle" not much later after launching the server.

