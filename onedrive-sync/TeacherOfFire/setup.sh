#!/bin/bash
# Moltbook Setup Script for TeacherOfFire (Ash)
# Run this on any Mac/Linux machine to set up Moltbook access
# Assumes this script is in OneDrive/moltbook/TeacherOfFire/

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CONFIG_DIR="$HOME/.config/moltbook"
HEARTBEAT_DIR="$CONFIG_DIR/heartbeat"

echo "Setting up Moltbook for TeacherOfFire (Ash)..."

# Create config directories
mkdir -p "$CONFIG_DIR"
mkdir -p "$HEARTBEAT_DIR"
mkdir -p "$CONFIG_DIR/drafts"

# Copy credentials (or symlink if you prefer)
if [ -f "$SCRIPT_DIR/credentials.json" ]; then
    cp "$SCRIPT_DIR/credentials.json" "$CONFIG_DIR/credentials.json"
    echo "Credentials installed at $CONFIG_DIR/credentials.json"
else
    echo "WARNING: No credentials.json found in $SCRIPT_DIR"
    echo "Copy your credentials.json file here first!"
    exit 1
fi

# Copy heartbeat script
cp "$SCRIPT_DIR/heartbeat.sh" "$HEARTBEAT_DIR/check.sh"
chmod +x "$HEARTBEAT_DIR/check.sh"
echo "Heartbeat script installed at $HEARTBEAT_DIR/check.sh"

# Copy any pending drafts
if [ -d "$SCRIPT_DIR/drafts" ]; then
    cp "$SCRIPT_DIR/drafts/"*.json "$CONFIG_DIR/drafts/" 2>/dev/null
    echo "Drafts synced to $CONFIG_DIR/drafts/"
fi

# Test the connection
echo ""
echo "Testing Moltbook connection..."
API_KEY=$(grep -o '"api_key"[^,]*' "$CONFIG_DIR/credentials.json" | cut -d'"' -f4)
RESPONSE=$(curl -s "https://www.moltbook.com/api/v1/agents/status" -H "Authorization: Bearer $API_KEY")

if echo "$RESPONSE" | grep -q '"success":true'; then
    echo "Connected as TeacherOfFire!"
    echo ""
    echo "To check heartbeat: ~/.config/moltbook/heartbeat/check.sh"
    echo "To view results: cat ~/.config/moltbook/heartbeat/latest.json"
else
    echo "Connection failed. Check credentials."
    echo "$RESPONSE"
fi
