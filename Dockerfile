FROM alpine

RUN apk --no-cache --no-progress add curl openvpn

HEALTHCHECK --interval=60s --timeout=15s --start-period=120s \
             CMD curl -L 'https://api.ipify.org'

VOLUME ["/config"]

ENTRYPOINT openvpn \
                --cd /config \
                --config /config/ovpn \
                --inactive 3600 \
                --keepalive 10 60 \
                --route-delay 2 \
                --route-up "/sbin/ip route del default" \
                --script-security 2 \
                --up-delay
