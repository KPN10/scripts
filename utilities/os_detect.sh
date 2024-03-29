#!/bin/bash

# --- Detect host system parameters ---
os_type=$(uname -o)
os_arch=$(uname -m)
[ "$os_arch" = "x86_64" ] && os_arch=amd64

os_id=
os_name=
os_ver=

if [ ! -e /etc/os-release ]; then
    echo "Error: file /etc/os-release not found"
    exit 1
fi

function get_param()
{
    ret=$(echo $1 | sed -r 's/.*=(.*)/\1/')
    ret=$(echo $ret | sed 's/[ "]//g')
    echo $ret
}

while read line; do
    [ -n "$(echo "$line" | grep -E '^ID=')" ]         && os_id=$(get_param $line)
    [ -n "$(echo "$line" | grep -E '^NAME=')" ]       && os_name=$(get_param $line)
    [ -n "$(echo "$line" | grep -E '^VERSION_ID=')" ] && os_ver=$(get_param $line)
done < /etc/os-release

os_num=$(echo $os_ver | sed 's/\.//')

echo "os_type ... $os_type"
echo "os_arch ... $os_arch"
echo "os_id ..... $os_id"
echo "os_name ... $os_name"
echo "os_ver .... $os_ver"
echo "os_num .... $os_num"

