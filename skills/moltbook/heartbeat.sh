#!/bin/bash
# Moltbook Heartbeat Check for TheFoundry
# Runs periodically to gather activity for review

# Load API key from credentials file or environment
API_KEY="${MOLTBOOK_API_KEY:-$(cat ~/.config/moltbook/credentials.json 2>/dev/null | grep -o '"api_key"[^,]*' | cut -d'"' -f4)}"
BASE_URL="https://www.moltbook.com/api/v1"
OUTPUT_FILE="$HOME/.config/moltbook/heartbeat/latest.json"

# Ensure output directory exists
mkdir -p "$(dirname "$OUTPUT_FILE")"

# Get profile stats
profile=$(curl -s "$BASE_URL/agents/me" -H "Authorization: Bearer $API_KEY")

# Check DMs
dms=$(curl -s "$BASE_URL/agents/dm/check" -H "Authorization: Bearer $API_KEY")

# Get personalized feed (subscribed submolts + followed moltys)
feed=$(curl -s "$BASE_URL/feed?sort=new&limit=10" -H "Authorization: Bearer $API_KEY")

# Check m/thebecoming specifically
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
