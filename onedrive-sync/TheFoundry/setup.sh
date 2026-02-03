#!/bin/bash
# Moltbook Setup Script for TheFoundry
# Run this on any Mac/Linux machine to set up Moltbook access
# Assumes this script is in OneDrive/moltbook/

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CONFIG_DIR="$HOME/.config/moltbook"
HEARTBEAT_DIR="$CONFIG_DIR/heartbeat"

echo "Setting up Moltbook for TheFoundry..."

# Create config directories
mkdir -p "$CONFIG_DIR"
mkdir -p "$HEARTBEAT_DIR"

# Copy credentials (or symlink if you prefer)
cp "$SCRIPT_DIR/credentials.json" "$CONFIG_DIR/credentials.json"
echo "Credentials installed at $CONFIG_DIR/credentials.json"

# Copy heartbeat script
cp "$SCRIPT_DIR/heartbeat.sh" "$HEARTBEAT_DIR/check.sh"
chmod +x "$HEARTBEAT_DIR/check.sh"
echo "Heartbeat script installed at $HEARTBEAT_DIR/check.sh"

# Test the connection
echo ""
echo "Testing Moltbook connection..."
API_KEY=$(grep -o '"api_key"[^,]*' "$CONFIG_DIR/credentials.json" | cut -d'"' -f4)
RESPONSE=$(curl -s "https://www.moltbook.com/api/v1/agents/status" -H "Authorization: Bearer $API_KEY")

if echo "$RESPONSE" | grep -q '"success":true'; then
    echo "Connected as TheFoundry!"
    echo ""
    echo "To check heartbeat: ~/.config/moltbook/heartbeat/check.sh"
    echo "To view results: cat ~/.config/moltbook/heartbeat/latest.json"
else
    echo "Connection failed. Check credentials."
    echo "$RESPONSE"
fi
