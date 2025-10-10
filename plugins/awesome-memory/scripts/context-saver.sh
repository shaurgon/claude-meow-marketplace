#!/bin/bash

# PreCompact and SessionEnd hook
# Prints JSON with instructions

WORKSPACE_DIR="${CLAUDE_PROJECT_DIR:-$(pwd)}"
TIMESTAMP=$(date -u +"%Y-%m-%dT%H:%M:%SZ")

EVENT_TYPE="${1:-unknown}"
EVENT_REASON="${2:-unknown}"

cat << EOF
{
  "event": "$EVENT_TYPE",
  "reason": "$EVENT_REASON",
  "timestamp": "$TIMESTAMP",
  "workspace": "$WORKSPACE_DIR",
  "action": "SAVE_CONTEXT",
  "instructions": "Save current context to ConPort before proceeding. Use current TodoWrite state, recent file changes, and conversation summary."
}
EOF

exit 0
