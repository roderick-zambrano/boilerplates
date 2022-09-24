# Stage 1: Get cfddns from crates.io
FROM alpine:latest as builder
# Install necessary dependencies for cfddns successful build
# cfddns requires cargo to install from crates.io
# cfddns requires openssl-dev for successful cargo build
RUN apk add --no-cache openssl-dev \ 
  cargo \
&& cargo install cfddns

# Stage 2: Set environment for execution
FROM alpine:latest
WORKDIR .
# Copy config files in working directory
COPY ./config ./config
# Copy cfddns built binary for execution
COPY --from=builder /root/.cargo/bin/cfddns ./
# Execute resulting image
CMD ["cfddns", "-c", "./config/cfddns.yml", "./config/domains"]
