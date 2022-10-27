# RustDesk

## Server Setup

To be able to set up the relay server, you need the address of the IP in which the server will be located. A domain name pointing to the IP will suffice.

The next step is to port forward all the necessary ports listed in the `hbbr` and `hbbs` services appropriately. After that, the configuration should function without any major issues.

## Notes

This might not seem obvious at first, but a RustDesk client requires an active display to function. This means that server computers without a monitor cannot be accessed with RustDesk, even if you successfully install the application by remote desktop from another protocol. RustDesk is a screen-sharing control application.
