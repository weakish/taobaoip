#!/bin/sh

# ip.taobao.com does not support IPv6.
readonly ipv4_regex='[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+'

# https://www.w3.org/Addressing/URL/5_BNF.html
readonly ialpha_regex="[A-Za-z]([-A-Za-z0-9\$_@.&+!*\"'(),%]*)"
readonly hostname_regex="($ialpha_regex\.)+($ialpha_regex)?"

readonly taobao_api='http://ip.taobao.com/service/getIpInfo.php?ip='


if echo "$1" | egrep -q $ipv4_regex; then
    readonly ip_query="$1"
    curl -s "$taobao_api$ip_query" |
    jq '.data | .country + .area + .region + .city + .county + .isp' |
    tr -d '"'
    # API limit: 10 queries per second.
    sleep 0.1
elif echo "$1" | egrep -q $hostname_regex; then
    readonly hostname_query="$1"
    mtr -r --tcp --no-dns "$hostname_query" |
    egrep -o "$ipv4_regex" |
    xargs -d '\n' -I {} taobaoip {}
else
    echo "Usage: taobaoip <ip>|<hostname>"
    exit 64  # EX_USAGE
fi
