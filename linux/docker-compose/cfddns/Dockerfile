# Cargo build tooling
FROM rust:slim-buster as builder
# Update libraries to install openssl-dev for cfddns installation and compilation
RUN apt update && apt install librust-cargo+openssl-dev -y && cargo install cfddns

# Lighter debian image
FROM debian:buster-slim
# Working directory to be bound to volume on host machine
WORKDIR /config
# Download necessary library for cfddns execution, including SSL certificate handling
RUN apt update && apt install librust-cargo+openssl-dev -y
# Extract compiled cfddns binary to local image
COPY --from=builder /usr/local/cargo/bin/cfddns /usr/bin

CMD ["cfddns", "-c", "cfddns.yml", "domains"]
