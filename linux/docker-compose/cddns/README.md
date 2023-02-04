# CDDNS Custom Image

This image is generated based on the cddns Rust implementation.

The Dockerfile used for the `docker build` details the steps with respective commentary descriptive enough where intuition might lack.

The `cddns_build.sh` script is simply used to build the image while adding it to the local registry docker container, so that it avoids trying to pull a new image from the cloud where it does not exist.

## Setup

The cddns utility contains mechanisms to populate configuration files. The main configuration requires following the wizard after the following command:

```bash
cddns config build
```

The supplementary configuration that is also required is the inventory, which accepts a domain-subdomain hierarchy in `YAML` format:

```YAML
some.domain.com:
 - some.sub.domain.com
```

After these configuration files are appropriately created (assuming respectively named config.toml and inventory.yml), you can run the following command to execute `cddns`:

```bash
cddns -c config.toml inventory watch
```

To change or update the configuration, simply update these files.