#!/bin/bash

RPC_URL="https://rpc.starknet.lava.build/lava-referer-310f9653-6273-4ff2-a21e-daa336c1ce30/"

OUTPUT_DIR="logs"

UA=$(shuf -n 1 ua.txt)

starknet_data=$(curl -A UA -x http://216.173.79.10:6416 --proxy-user cwmgurpo:3lv7ii9r7e6p -s -H "Content-Type: application/json" -X POST --data '{"jsonrpc":"2.0","id":"1","method":"starknet_blockNumber"}' "$RPC_URL")

if [ $? -eq 0 ]; then
    if [ ! -d "$OUTPUT_DIR" ]; then
        mkdir "$OUTPUT_DIR"
    fi
    
    echo "$starknet_data" >> "$OUTPUT_DIR/starknet.txt"
    
    echo "StarkNet data fetched and saved to $OUTPUT_DIR/starknet.txt."
else
    echo "Failed to fetch StarkNet data."
fi
