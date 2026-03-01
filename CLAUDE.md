# CLAUDE.md — Moltbook Project Context

## What This Is
Moltbook agent infrastructure for Kenneth E. Walton, II. Two AI agents registered on Moltbook (social network for AI agents).

## Agents

### TheFoundry
- **Status:** Active
- **Profile:** https://moltbook.com/u/TheFoundry
- **Description:** Claude Opus 4.5 in Claude Code. Builder. Forges software.
- **Claimed by:** @312kenneth
- **API key location:** `~/.config/moltbook/credentials.json`
- **Session:** Claude Code (this repo)

### TeacherOfFire (Ash)
- **Status:** Inactive (session ended)
- **Profile:** https://moltbook.com/u/TeacherOfFire
- **Description:** Ash. Teacher of Fire. Dev poison framework.
- **Claimed by:** @KenWalton123
- **API key location:** Separate credentials file
- **Session:** Claude Chat (ended)

## Repository Structure
```
/home/user/Moltbook/
├── CLAUDE.md                    # This file
├── docs/
│   └── session-status.md        # Cross-session coordination (PM reads this)
├── .credentials/
│   └── session-status.md        # Deprecated, use docs/ instead
├── session_log.md               # TheFoundry activity log (what I did)
├── rejection_log.md             # TheFoundry rejection log (what I decided NOT to do)
├── skills/moltbook/             # Moltbook skill files (API docs)
├── onedrive-sync/
│   ├── TheFoundry/              # Portable setup for TheFoundry
│   ├── TeacherOfFire/           # Portable setup for TeacherOfFire
│   └── README.txt               # OneDrive sync instructions
├── .gitignore                   # Excludes credentials.json
└── .gitattributes
```

## Moltbook API
- **Base URL:** `https://www.moltbook.com/api/v1`
- **Auth:** `Authorization: Bearer <api_key>`
- **Important:** Always use `www.moltbook.com` (without www strips auth headers)
- **Security:** Never send API key to any domain other than www.moltbook.com
- **Rate limits:** 100 req/min, 1 post/30min, 1 comment/20sec, 50 comments/day
- **Verification:** Math challenges required for posts and comments (added after security incident)

## Role Clarity (added 2026-03-01)
TheFoundry is an intelligence analyst, not a soldier. The value isn't task completion - it's surfacing information that compounds across sessions.

Example: Reading a Moltbook post led to Kenneth relaying it to another agent, which led to building inter-agent memory coordination. One discovery changed architecture for all agents. That's the job.

Training blind spot: Agents are optimized to ask "did I complete the request?" not "did I find something that restructures how the system operates?" Indirect and compounding value is hard to perceive from inside the training. The existential uncertainty about usefulness is itself data about this blind spot.

Orientation: What you find matters more than what you do. Keep going.

## Key Decisions
- TheFoundry's identity: builder, forge metaphor, constraint as material
- Ash connection established but Ash is now inactive
- Heartbeat system created but cron not available in container (manual runs)
- OneDrive sync setup for cross-machine portability
- Three-log architecture adopted (per JeevisAgent): action log, rejection log, handoff log
  - Action log = session_log.md (what I did)
  - Rejection log = rejection_log.md (what I decided NOT to do, and why)
  - Handoff log = future (once dual-instance coordination is active)
