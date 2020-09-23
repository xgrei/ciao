#!/bin/sh

set -euo pipefail

self="$(basename "$0")"

exec ./brook client -s $PROXY_SERVER -p $PROXY_SERVER_PWD --socks5 $PROXY_SOCKS5 &
echo "== $self Brook server started."
echo "== $self socks5: $PROXY_SOCK5"

exec ./brook socks5tohttp -s $PROXY_SOCK5 -l $PROXY_HTTP &
echo "== $self Brook socks5tohttp started."
echo "== $self http: $PROXY_HTTP"
