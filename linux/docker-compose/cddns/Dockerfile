# Cargo build tooling
FROM rustlang/rust:nightly-slim as builder
# Update libraries to install openssl-dev for cddns installation and compilation, cddns also requires nightly rust features
RUN apt update && apt install librust-cargo+openssl-dev -y && cargo +nightly install cddns

# Lighter debian image
FROM debian:buster-slim
# Working directory to be bound to volume on host machine
WORKDIR /config
# Download necessary library for cddns execution, including SSL certificate handling
RUN apt update && apt install librust-cargo+openssl-dev -y
# Extract compiled cddns binary to local image
COPY --from=builder /usr/local/cargo/bin/cddns /usr/bin

CMD ["cddns", "-c", "cddns.toml", "inventory", "watch"]
