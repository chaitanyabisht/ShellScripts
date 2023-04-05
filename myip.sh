#!/bin/bash

# This script calls the Cloudflare CDN endpoint at https://cloudflare.com/cdn-cgi/trace
# and extracts the public IP address from the response.

# Send a GET request to the endpoint and store the response in the `response` variable
response=$(curl -s https://cloudflare.com/cdn-cgi/trace)

while read -r line; do
    if [[ $line == ip=* ]]; then
        # Extract the IP address from the line and assign it to the `ip` variable
        ip=${line#*=}
        echo $ip
        break
    fi
done <<< "$response"
