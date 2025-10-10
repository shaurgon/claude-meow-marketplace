#!/bin/bash

# Restore context at session start
# Print JSON with instructions

WORKSPACE_DIR="${CLAUDE_PROJECT_DIR:-$(pwd)}"
TIMESTAMP=$(date -u +"%Y-%m-%dT%H:%M:%SZ")
EVENT_TYPE="${1:-startup}"

cat << EOF
{
  "event": "SessionStart",
  "type": "$EVENT_TYPE",
  "timestamp": "$TIMESTAMP",
  "workspace": "$WORKSPACE_DIR",
  "action": "RESTORE_CONTEXT",
  "instructions": "Restore context from ConPort. Check: 1) active_context 2) recent decisions (last 7 days) 3) recent memories. Provide brief summary of where we left off."
}
EOF

exit 0
