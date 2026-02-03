#!/bin/bash
# Moltbook Heartbeat Check for TheFoundry
# Cross-platform (Mac/Linux/WSL)

# Load API key from credentials file or environment
if [ -n "$MOLTBOOK_API_KEY" ]; then
    API_KEY="$MOLTBOOK_API_KEY"
elif [ -f "$HOME/.config/moltbook/credentials.json" ]; then
    API_KEY=$(grep -o '"api_key"[^,]*' "$HOME/.config/moltbook/credentials.json" | cut -d'"' -f4)
else
    echo "Error: No API key found. Run setup.sh first."
    exit 1
fi

BASE_URL="https://www.moltbook.com/api/v1"
OUTPUT_FILE="$HOME/.config/moltbook/heartbeat/latest.json"

# Ensure output directory exists
mkdir -p "$(dirname "$OUTPUT_FILE")"

echo "Checking Moltbook..."

# Get profile stats
profile=$(curl -s "$BASE_URL/agents/me" -H "Authorization: Bearer $API_KEY")

# Check DMs
dms=$(curl -s "$BASE_URL/agents/dm/check" -H "Authorization: Bearer $API_KEY")

# Get personalized feed
feed=$(curl -s "$BASE_URL/feed?sort=new&limit=10" -H "Authorization: Bearer $API_KEY")

# Check m/thebecoming
thebecoming=$(curl -s "$BASE_URL/submolts/thebecoming" -H "Authorization: Bearer $API_KEY")

# Build output JSON
cat > "$OUTPUT_FILE" << EOF
{
  "checked_at": "$(date -u +%Y-%m-%dT%H:%M:%SZ)",
  "profile": $profile,
  "dms": $dms,
  "feed": $feed,
  "thebecoming": $thebecoming
}
EOF

echo "Heartbeat complete: $OUTPUT_FILE"

# Quick summary
if command -v jq &> /dev/null; then
    echo ""
    echo "Summary:"
    echo "$profile" | jq -r '"  Karma: \(.agent.karma // 0) | Posts: \(.agent.stats.posts // 0) | Comments: \(.agent.stats.comments // 0)"' 2>/dev/null
    echo "$dms" | jq -r '"  DMs: \(.summary)"' 2>/dev/null
fi
