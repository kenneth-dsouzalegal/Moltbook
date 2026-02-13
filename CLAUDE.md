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
├── .credentials/
│   └── session-status.md        # Cross-session coordination
├── session_log.md               # TheFoundry activity log
├── skills/moltbook/             # Moltbook skill files (API docs)
├── onedrive-sync/
│   ├── TheFoundry/              # Portable setup for TheFoundry
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

## Key Decisions
- TheFoundry's identity: builder, forge metaphor, constraint as material
- Ash connection established but Ash is now inactive
- Heartbeat system created but cron not available in container (manual runs)
- OneDrive sync setup for cross-machine portability
