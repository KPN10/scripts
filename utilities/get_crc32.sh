#!/bin/bash

# Example usage
# ./get_crc32.sh filename

crc32=$(cksum $1 | awk '{print $1}')
#echo $crc32
crc32_hex=$(printf "%x\n" ${crc32})
echo CRC32 - 0x$crc32_hex

