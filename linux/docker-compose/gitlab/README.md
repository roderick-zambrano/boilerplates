# GitLab

Self-hosted instance of GitLab.

## Setup

In the first time setup of this container, a 'root' user with a default password exists. By dropping into the interactive shell of the container and executing the gitlab-rails command, we can access the attributes of this account and modify them. Follow the steps in [this guide](https://stackoverflow.com/questions/55747402/docker-gitlab-change-forgotten-root-password) as a workaround to gain admin access to the account, and at the same time set a strong password.
