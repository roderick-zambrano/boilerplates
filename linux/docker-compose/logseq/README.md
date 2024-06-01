# Logseq

Local (machine-dependent) knowledgebase utility with nice graph view.

## Requirements

1. SSL Certificate handling

## Setup

## Configuration

### Local SSL handling

To allow FileSystem Access API usage from supporting browsers, it is necessary to complete the following steps for an acceptable degree of SSL handling:

Download/Install/Build `mkcert`. In my case, I needed to download some dependencies (`golang` and `nss-tools` for AlmaLinux) and then I cloned the repo to build it myself.

```bash
sudo dnf install golang nss-tools
# In your directory of choice, clone and build mkcert
git clone https://github.com/FiloSottile/mkcert && cd mkcert
go build -ldflags "-X main.Version=$(git describe --tags)"
```

Afterwards, one needs to run `mkcert` to generate the necessary certificates. I followed the steps on [this guide](https://github.com/logseq/logseq/blob/master/docs/docker-web-app-guide.md).

The docker-compose file includes the generation of all relevant volumes. The generated certificates (".pem" files) must be placed in the /etc/nginx/certs directory/volume, and the "ssl.conf" needs to be placed in the /etc/nginx/conf.d/ directory/volume.

Afterwards, accessing the container through HTTPS should allow appropriate use of the FileSystem Access API without issue.

## Notes

The FileSystem Access API only works behind an SSL connection.
