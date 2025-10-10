Restore context from ConPort and ClickUp using the intelligent context-manager agent.

Use the Task tool to launch the context-manager agent with the following prompt:
"Restore project context from ConPort and ClickUp. Provide an intelligent briefing with ConPort decisions, active ClickUp tasks, time tracking summary, and synthesized next actions."

---

## Manual Mode (if agent unavailable)

If you need to restore context manually, follow these guidelines:

### What to load from ConPort

### 1. Product Context (`mcp__conport__get_product_context`)
Load project overview:
- Project name, description, goals
- Technology stack
- Core features and architecture
- Current project status

### 2. Active Context (`mcp__conport__get_active_context`)
Load current work state:
- Current focus and session summary
- Recent completed tasks and files changed
- Next steps and planned work
- Current branch and uncommitted changes
- Any blockers

### 3. Recent Decisions (`mcp__conport__get_decisions`)
Retrieve last 5-10 architectural decisions:
- Decision summaries and rationale
- Implementation details
- Relevant tags for filtering

### 4. Recent Progress (`mcp__conport__get_progress`)
Check task progress:
- Recently completed tasks
- In-progress items
- Pending work

### 5. Recent Activity Summary (`mcp__conport__get_recent_activity_summary`)
Get overview of last 24-48 hours:
- New decisions, progress entries
- Context updates
- System pattern changes

### 6. ClickUp Tasks (Optional)
Load task management context:

**Search Active Tasks:**
- Use `mcp__clickup__searchTasks` with `assigned_to_me: true`
- Filter by `only_todo: true` to see open tasks
- Get task priorities and statuses

**Get Recent Time Entries:**
- Use `mcp__clickup__getTimeEntries` to see what was worked on recently
- Understand time allocation and focus areas

**Load Task Details:**
- Use `mcp__clickup__getTaskById` for important tasks
- Read comments for recent updates and discussions

**Search Related Spaces:**
- Use `mcp__clickup__searchSpaces` to understand project structure

## Output Format

After loading all context, provide:

**[CONPORT_ACTIVE]** status indicator

### Project Status
- Brief project description
- Current phase/milestone

### Where We Left Off
- Last session's focus and accomplishments
- Files created/modified
- Key decisions made

### Recent Decisions (last 7 days)
- List important architectural/implementation decisions

### Current State
- Active branch
- Uncommitted changes
- Open tasks or blockers

### ClickUp Tasks (if available)
- Active tasks with status and priority
- Recent time tracking summary
- Task links: https://app.clickup.com/t/TASK_ID
- Upcoming deadlines or blockers

### Next Steps
- Suggested actions based on active_context and ClickUp tasks
- Prioritized list combining ConPort and ClickUp data
- Ask: "Continue previous work?" or "What should we work on?"

## Example Usage

Run this command at the start of a session to quickly understand project state from both ConPort (decisions, context) and ClickUp (tasks, time tracking) and continue where you left off.