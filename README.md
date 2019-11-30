This is a Docker container that is intended to provide a VPN connection to other Docker containers that have not been configured to specifically support one.

Simply run containers that you want to use this container's VPN connection with `--net=container:atemu12/openvpn-docker-proxy` and their traffic will be routed through this container's VPN tunnel instead.

Note: This will route ALL their traffic through this container which includes the traffic you might want to get to your LAN.  
To access the services of the containers proxied by this container, you need to expose and access the ports on this container instead.  
The main purpose of this container is to give actual proxy servers (HTTP(S), SOCKS) a VPN connection they can relay or for use with conainers that don't provide network accessible services (e.g. download things to local storage).

This container needs:

- An ovpn file at `/config/ovpn` 
- An auth file at `/config/auth` (username on the first and password on the second line) 
- A tunnel device (e.g. `--device=/dev/net/tun`)
- The `NET_ADMIN` capability (`--cap-add=NET_ADMIN`)

Read the Dockerfile for more info.
