#!/bin/bash

if [ "$#" -le 0 ]; then
    echo "Usage: $0 FILENAME" >&2
    exit 1;
fi

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
FILE="$1"

cat "$FILE" | $SCRIPT_DIR/access-log-parser.pl "INSERT INTO access (date, method, url, status, size, time_ms, referer, ua) VALUES ('%t', '%m', '%U', %s, %b, %T, '%i{Referer}', '%i{User-Agent}');" | psql >/dev/null

