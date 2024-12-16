#!/bin/bash

if [ -z "$1" ]; then
    echo "Usage: bash recon.sh <domain>"
    exit 1
fi

DOMAIN=$1

# Run Subfinder to discover subdomains
echo "Running Subfinder on $DOMAIN..."
subfinder -d "$DOMAIN" -o subdomains.txt

# Run Httprobe to check for live subdomains
echo "Running Httprobe..."
cat subdomains.txt | sort -u | httprobe -p -prefer-https > alive_subdomain.txt

# Run EyeWitness to take screenshots of the live subdomains
echo "Running EyeWitness on live subdomains..."
python3 /opt/EyeWitness/Python/EyeWitness.py -f alive_subdomain.txt --web --timeout=10

echo "Reconnaissance for $DOMAIN is complete."
