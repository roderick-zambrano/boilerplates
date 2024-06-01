# RustDesk

## Requirements

## Setup

To be able to set up the relay server, you need the address of the IP in which the server will be located. A domain name pointing to the IP will suffice.

The next step is to port forward all the necessary ports listed in the `hbbr` and `hbbs` services appropriately. After that, the configuration should function without any major issues.

## Configuration

## Notes

This might not seem obvious at first, but a RustDesk client requires an active display to function. This means that server computers without a monitor cannot be accessed with RustDesk easily, even if you successfully install the application by remote desktop from another protocol. RustDesk is a screen-sharing control application.

Version 1.1.11-1 introduced mandatory client-side key requirement. When the container starts, it generates an id_ed25519 key pair if none already exists in the data volume. To avoid requiring the use of this key in the client side, you must run the `hbbs` command with a `-k ""` flag, for empty key. Otherwise, the client will require the content of the id_ed25519.pub key in the Key field of the application to connect to other devices.
