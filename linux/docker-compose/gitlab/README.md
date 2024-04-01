# GitLab

Self-hosted instance of GitLab.

## Setup

In the first time setup of this container, a 'root' user with a default password exists. To get the initial password, execute the following command:

```
sudo docker exec -it gitlab grep 'Password:' /etc/gitlab/initial_root_password
```
