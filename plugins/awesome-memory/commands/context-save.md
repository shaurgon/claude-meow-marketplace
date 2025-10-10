Save current context to ConPort and ClickUp using the intelligent context-manager agent.

Use the Task tool to launch the context-manager agent with the following prompt:
"Analyze the current session and save comprehensive context to ConPort and ClickUp. Include conversation analysis, git changes, decisions made, next steps, and create/update ClickUp tasks as needed."

---

## Manual Mode (if agent unavailable)

If you need to save context manually, follow these guidelines:

### What to save to ConPort

### 1. Update Active Context (`mcp__conport__update_active_context`)
Create a comprehensive snapshot with:
- **current_focus**: Brief description of what you're working on
- **session_summary**: Summary of work done in this session
- **recent_work**: Object containing:
  - `completed_tasks`: Array of completed tasks
  - `files_created`: Array of new files with brief descriptions
  - `files_modified`: Array of modified files with changes
  - `key_findings`: Important discoveries or insights
- **next_steps**: Array of planned next actions
- **current_branch**: Git branch name
- **uncommitted_changes**: Array of files with uncommitted changes
- **blockers**: Any issues or blockers (if applicable)

### 2. Log Decisions (`mcp__conport__log_decision`)
If architectural or implementation decisions were made:
- **summary**: Concise decision summary
- **rationale**: Why this decision was made
- **implementation_details**: How it will be/was implemented
- **tags**: Relevant categorization tags

### 3. Log Progress (`mcp__conport__log_progress`)
For each completed task:
- **status**: DONE, IN_PROGRESS, or TODO
- **description**: Task description
- **linked_item_type** and **linked_item_id**: Link to related decisions if applicable

### 4. Update TodoWrite State
Check current todos and save their state to active_context if relevant.

### 5. ClickUp Integration (Optional)
Enhance context persistence with task management:

**Search for Related Tasks:**
- Use `mcp__clickup__searchTasks` to find existing tasks related to current work
- Check task status and update if work was completed

**Create Tasks from Next Steps:**
- Use `mcp__clickup__createTask` for action items from next_steps
- Include links to ConPort decisions in task descriptions
- Format: `Related decision: [decision_id]`

**Update Task Progress:**
- Use `mcp__clickup__updateTask` to reflect completed work
- Add status transitions (e.g., TODO → IN_PROGRESS → DONE)

**Add Progress Comments:**
- Use `mcp__clickup__addComment` to document what was accomplished
- Include links to relevant files or decisions
- Format: `Completed: [description]. Related: https://app.clickup.com/t/TASK_ID`

**Log Time Entries:**
- Use `mcp__clickup__createTimeEntry` for time tracking
- Include description of work done

## Example Usage

After completing a feature, fixing bugs, or before `/compact` or `/clear`, run this command to ensure all work is preserved in ConPort and optionally tracked in ClickUp for future sessions.
