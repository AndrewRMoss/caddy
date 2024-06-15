FROM caddy:builder AS builder

RUN xcaddy build \
    --with github.com/caddy-dns/cloudflare \
    --with github.com/mholt/caddy-dynamicdns \
    --with github.com/zhangjiayin/caddy-geoip2 \
    --with github.com/WeidiDeng/caddy-cloudflare-ip \
    --with github.com/hslatman/caddy-crowdsec-bouncer/crowdsec

FROM caddy:latest

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
