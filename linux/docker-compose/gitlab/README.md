# GitLab

Self-hosted instance of GitLab.

## Requirements

## Setup

In the first time setup of this container, a 'root' user with a default password exists. To get the initial password, jump into the rails console and simply do this to change it:

```
gitlab-rails console 
# find root user
user = User.where(id: 1).first
# modify your password
user.password = 'secret_pass'
user.password_confirmation = 'secret_pass'
# save your password
user.save!
```

## Configuration

## Notes

