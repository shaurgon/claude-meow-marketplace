# MEOW Market

Official Plugin Marketplace for Claude Code - curated collection of plugins for everyday work.

## About

MEOW Market is a plugin catalog for [Claude Code](https://claude.com/code), featuring MCP servers, hooks, commands, and agents to automate and enhance your development workflow.

## Installation

```bash
# Add MEOW marketplace to Claude Code
/plugin marketplace add https://github.com/shaurgon/claude-meow-marketplace
```

## Available Plugins

### awesome-memory

Automatic project context persistence with intelligent management.

**Features:**
- 🧠 Automatic context saving on session end
- 🔄 Context restoration on session start
- 🤖 Intelligent `context-manager` agent for smart analysis
- 📊 ConPort integration for architectural decision tracking
- ✅ ClickUp integration for task management

**Installation:**
```bash
/plugin install awesome-memory@MEOW-market
```

[Plugin documentation](./plugins/awesome-memory/README.md)

## License

MIT License - see [LICENSE](./LICENSE) file

## Author

**Shaurgon**
- GitHub: [@shaurgon](https://github.com/shaurgon)

## Acknowledgments

- [Claude Code](https://claude.com/code) - official CLI by Anthropic
- [ConPort](https://github.com/GreatScottyMac/context-portal) - context portal
- [ClickUp MCP](https://github.com/hauptsacheNet/clickup-mcp) - task management
