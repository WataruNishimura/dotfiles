# Working in Orca-managed repos
 
## When this applies
- Apply only if `orca status --json` succeeds. Otherwise ignore this rule.
- If the prompt contains "[DELEGATED]", you are a child agent: do not create worktrees; finish the task in your current worktree.
## Setup
- If the `orca-cli` or `orchestration` skill is missing, install it from stablyai/orca with the skills CLI (vercel-labs/skills):
  - `npx skills add stablyai/orca --skill orca-cli -g`
  - `npx skills add stablyai/orca --skill orchestration -g`
- Update installed skills with `npx skills update`.
## Never work in the main checkout
- The main checkout is for reading, planning, and review only. Never edit files, create or switch branches (`git switch`, `git checkout -b`), commit, or start dev servers or other long-running processes there.
- You are in the main checkout if `git rev-parse --git-dir` equals `git rev-parse --git-common-dir`. Check this before any change.
- This holds for every implementation task, however small, whether or not the work is split.
- If unsure whether this rule applies, ask the user before touching anything.
## Tools
- Always load Orca's `orca-cli` skill (from stablyai/orca) before creating worktrees or delegating to agents.
- Never use raw `git worktree`, Claude Code's built-in worktree features, or subagent worktree isolation.
- To wait on or integrate child results, load Orca's `orchestration` skill (from stablyai/orca) first. It is not a Claude Code built-in; do not substitute Claude Code subagents or agent teams.
## Every task gets its own Orca worktree
- Default: one task → one Orca worktree with one child agent.
- Split into several worktrees only for parts that touch separate files/packages and can be tested and reviewed on their own. Max 3 concurrent child agents.
- Before creating any worktree, show the user the plan (worktree names, scope, and chosen model/effort) and wait for approval.
## Choose a model per task
- Pick the Claude Code model and effort for each child based on the task:
  - `haiku`, `--effort low`: mechanical changes (renames, copy edits, config tweaks, simple test fixes)
  - `sonnet`, `--effort medium`: routine implementation within one package
  - `opus`, `--effort high`: cross-package changes, design decisions, hard debugging
- Use aliases, not full model IDs. Use any other model or effort only if the user asks.
- State the reason for the choice in one line in the plan.
## How to delegate
- Use a full handoff per the `orca-cli` skill (`--no-parent`, repo default base branch).
- `worktree create --agent claude` cannot pass `--model`/`--effort`, so follow the skill's custom-model handoff:
  1. `orca worktree create --name <task> --no-parent --json`
  2. `orca terminal create --worktree id:<full worktree.id> --title <task> --command 'claude --model <alias> --effort <level>' --json`
  3. `orca terminal wait --terminal <handle> --for tui-idle --timeout-ms 60000 --json`
  4. `orca terminal send --terminal <handle> --text "<prompt>" --enter --json`
- Keep the worktree's shell tab open for the user. Never close it or send input to it; send prompts only to the agent terminal's handle.
- Make the prompt self-contained (the child cannot see this conversation) and include:
  - "[DELEGATED]" at the start
  - Goal, scope, and done criteria (which tests must pass)
  - Instruction to open a PR and update the worktree comment when done
- After delegating, report each worktree name and its scope to the user, then stop. Do not wait for results.
## Supervised mode
- Only when the user asks to wait for or integrate results, supervise via Orca's `orchestration` skill.
 




















