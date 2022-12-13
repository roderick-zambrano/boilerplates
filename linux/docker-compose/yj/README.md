# YJ Container

This container is being listed here for personal reference purposes. Since config files are written in TOML format, but some applications such as Portainer require YAML configuration files, which makes this application incredibly useful.

## Usage

The recommended usage for this application is the following:

```bash
docker run --rm sclevine/yj -ty < origin-toml-file.toml > target-yaml-file.yml
```

Upon executino,this spins up a single-run, temporary `yj` container with the `-ty` flag, which will take a TOML file as input and output it as a YAML file. After the process is completed, the container is deleted.

To simplify calling this process, and in a standard form, it is possible to create a predetermined `bash` function using the line above to abbreviate the process into a single call, such as `ty` for example.