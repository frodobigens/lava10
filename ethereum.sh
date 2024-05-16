#!/bin/bash

RPC_URL="https://eth1.lava.build/lava-referer-310f9653-6273-4ff2-a21e-daa336c1ce30/"
OUTPUT_DIR="logs"

UA=$(shuf -n 1 ua.txt)

eth_data=$(curl -A UA -x http://216.173.79.10:6416 --proxy-user cwmgurpo:3lv7ii9r7e6p -s -H "Content-type: application/json" -X POST --data '{"jsonrpc":"2.0","method":"eth_gasPrice","id":1}' "$RPC_URL")

if [ $? -eq 0 ]; then
    if [ ! -d "$OUTPUT_DIR" ]; then
        mkdir "$OUTPUT_DIR"
    fi
    
    echo "$eth_data" >> "$OUTPUT_DIR/ethereum.txt"
    
    echo "Ethereum data fetched and saved to $OUTPUT_DIR/ethereum.txt."
else
    echo "Failed to fetch Ethereum data."
fi
