# CFDDNS Custom Image

This image is generated based on the cfddns Rust implementation.

The Dockerfile used for the `docker build` details the steps with respective commentary descriptive enough where intuition might lack.

The `cfddns_build.sh` script is simply used to build the image while adding it to the local registry docker container, so that it avoids trying to pull a new image from the cloud where it does not exist.
