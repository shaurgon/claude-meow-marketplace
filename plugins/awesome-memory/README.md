# awesome-memory

Intelligent context persistence that automatically saves and restores your project state between Claude Code sessions.

## Features

- 🧠 **Automatic Context Saving** - Saves context on PreCompact and SessionEnd hooks
- 🔄 **Smart Context Restoration** - Restores context on SessionStart with intelligent analysis
- 🤖 **Context Manager Agent** - AI agent for smart decision extraction and synthesis
- 📊 **ConPort Integration** - Tracks architectural decisions and project context
- ✅ **ClickUp Integration** - Manages tasks, comments, and time tracking
- 🔗 **Cross-System Linking** - Connects ConPort decisions with ClickUp tasks

## Installation

```bash
/plugin install awesome-memory@meow-market
```

## Required MCP Servers

### ConPort

Context Portal for architectural decision tracking.

```bash
# Install via uvx (automatic when plugin loads)
uvx --from context-portal-mcp conport-mcp --mode stdio --log-level INFO
```

### ClickUp (Optional)

Task management integration.

**Setup:**

1. Get your ClickUp credentials:
   - **API Token**: Go to [ClickUp Settings → Apps](https://app.clickup.com/settings/apps) → Generate API Token
   - **Team ID**: Open any ClickUp workspace URL - the number after `/team/` is your team ID
     - Example: `https://app.clickup.com/90151492438/home` → Team ID: `90151492438`

2. Set environment variables:

```bash
# Add to your shell profile (~/.zshrc, ~/.bashrc, etc.)
export CLICKUP_API_KEY="your_api_token_here"
export CLICKUP_TEAM_ID="your_team_id_here"
```
**OR** append to settings.json:
```json
{
   "env": {
      "CLICKUP_API_KEY": "your_api_token_here",
      "CLICKUP_TEAM_ID": "your_team_id_here"
   }
}
```
[Official Docs](https://docs.claude.com/en/docs/claude-code/settings#available-settings)

3. Reload your shell or restart Claude Code:

```bash
source ~/.zshrc  # or ~/.bashrc
```

**Note:** ClickUp integration is optional but recommended. The plugin works with ConPort only if you don't configure ClickUp credentials.

## Commands

### `/context-save`

Save current context to ConPort and ClickUp.

**What it does:**
- Analyzes conversation and git changes
- Extracts architectural decisions automatically
- Saves to ConPort with proper linking
- Creates/updates ClickUp tasks (if configured)
- Adds progress comments to tasks
- Logs time entries

**Usage:**
```bash
/context-save
```

### `/context-restore`

Restore context from ConPort and ClickUp.

**What it does:**
- Loads ConPort decisions, progress, and patterns
- Loads active ClickUp tasks (if configured)
- Gets recent time tracking
- Synthesizes intelligent briefing
- Suggests next actions

**Usage:**
```bash
/context-restore
```

## Agents

### context-manager

Intelligent agent that handles context operations with smart analysis.

**Capabilities:**
- Automatic decision extraction from conversations
- Smart categorization and tagging
- ClickUp task creation from next_steps
- Cross-system linking (ConPort ↔ ClickUp)
- Quality assurance and completeness checks

**Invoked by:**
- `/context-save` and `/context-restore` commands
- Hooks (PreCompact, SessionEnd, SessionStart)

## Hooks

### Automatic Triggers

- **PreCompact** - Before compacting conversation history
- **SessionEnd** - When ending a Claude Code session
- **SessionStart** - When starting a new session

These hooks automatically save/restore context without manual intervention.

## How It Works

### Context Saving Flow

1. **Trigger** - PreCompact, SessionEnd, or `/context-save`
2. **Analysis** - Context manager agent analyzes conversation
3. **Git Check** - Reviews changes via `git status` and `git diff`
4. **Decision Extraction** - Identifies architectural decisions
5. **ConPort Save** - Logs decisions, updates active_context
6. **ClickUp Integration** (if configured):
   - Searches for related tasks
   - Creates tasks from next_steps
   - Updates task statuses
   - Adds progress comments
   - Logs time spent

### Context Restoration Flow

1. **Trigger** - SessionStart or `/context-restore`
2. **Load ConPort** - Gets product/active context, decisions, progress
3. **Load ClickUp** (if configured) - Gets active tasks, time entries
4. **Synthesis** - Correlates data from both systems
5. **Briefing** - Presents structured overview with:
   - Where we left off
   - Recent decisions
   - Active tasks with links
   - Next suggested actions

## Examples

### Example Session

```bash
# Morning - start session
# Automatic context restoration via SessionStart hook
> [CONPORT_ACTIVE] Welcome back!
> Last session: Added ClickUp integration to awesome-memory
> Active tasks:
>   - Update README.md (https://app.clickup.com/t/abc123)
>   - Test plugin installation (https://app.clickup.com/t/def456)

# Work on features...

# Evening - end session
# Automatic context save via SessionEnd hook
> Context saved:
> - Decision: ClickUp integration architecture
> - Progress: Updated README, added environment setup
> - ClickUp: Task abc123 → DONE, logged 2.5h
```

## Troubleshooting

### ClickUp Not Working

**Check environment variables:**
```bash
echo $CLICKUP_API_KEY
echo $CLICKUP_TEAM_ID
```

Both should print values. If empty, add to shell profile and reload.

**Verify API token:**
- Go to ClickUp Settings → Apps
- Check token is active and has correct permissions

### ConPort Database Issues

ConPort database is stored in `context_portal/context.db`. If corrupted:

```bash
rm -rf context_portal/
# Will recreate on next use
```

## Development

### Local Testing

```bash
# Clone marketplace
git clone https://github.com/shaurgon/claude-marketplace.git
cd claude-marketplace

# Add local marketplace
/plugin marketplace add file://$(pwd)/.claude-plugin/marketplace.json

# Install plugin
/plugin install awesome-memory@meow-market
```

## Contributing

Issues and pull requests welcome at [claude-marketplace](https://github.com/shaurgon/claude-marketplace).

## License

MIT - see [LICENSE](../../LICENSE)

## Author

**Shaurgon**
- GitHub: [@shaurgon](https://github.com/shaurgon)
