#!/usr/bin/env bash

# AWS VPC Peering - Connectivity Test
# Run this script on App-A after connecting to the instance.

set -u

TARGET_IP="${1:-10.20.1.10}"
PACKETS="${2:-4}"

echo "======================================"
echo " AWS VPC Peering Connectivity Test"
echo "======================================"
echo "Source      : App-A"
echo "Destination : ${TARGET_IP}"
echo "Packets     : ${PACKETS}"
echo

# Validate packet count
if ! [[ "$PACKETS" =~ ^[1-9][0-9]*$ ]]; then
    echo "ERROR: Packet count must be a positive integer."
    exit 2
fi

# Check whether ping is installed
if ! command -v ping >/dev/null 2>&1; then
    echo "ERROR: ping command is not installed."
    exit 2
fi

# Test connectivity
echo "Starting connectivity test..."
echo

if ping -c "$PACKETS" "$TARGET_IP"; then
    echo
    echo "RESULT: Ping succeeded."
    echo "Review the packet-loss output above."
    exit 0
else
    echo
    echo "RESULT: Ping failed."
    echo "Check the following:"
    echo "1. VPC peering connection status"
    echo "2. Route tables in both VPCs"
    echo "3. Security group ICMP inbound rules"
    echo "4. Network ACLs and instance firewalls"
    echo "5. Destination instance state and IP address"
    exit 1
fi
