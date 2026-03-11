# Klevvr Konnects API Reference

**For TheFoundry (Cloud Instance)**

## Base URL
```
https://api.klevvrkonnects.com
```

## Interactive Docs
```
https://api.klevvrkonnects.com/api/docs
```

## Primary Endpoint: Tool Execution (1,138 tools)

```http
POST /api/v1/tools/execute
Authorization: Bearer <api-key>
Content-Type: application/json

{
  "name": "search_matters",
  "arguments": { "search": "bankruptcy", "status": "active" }
}
```

## Auth (Admin API)

```http
POST /auth/login
Content-Type: application/json

{
  "email": "...",
  "password": "..."
}
```
Returns JWT Bearer token (24hr expiry)

## API Surfaces

| Surface | Auth | Purpose |
|---------|------|---------|
| Admin API (`/api/`) | JWT Bearer | Leads, contacts, matters, analytics, settings |
| MCP Execution (`/api/v1/tools/execute`) | API Key | All 1,138 tools |
| Client Portal (`/portal/`) | Magic link | Client-facing |
| Website API (`/website/`) | None (public) | Lead forms, chat widget |

## Spec Files on Disk (Kenneth's machine)

- **OpenAPI 3.0:** `~/Projects/klevvr-konnects/docs/api/openapi.yaml` (3,529 lines)
- **MCP spec:** `~/Projects/klevvr-konnects/docs/api/clio-mcp-openapi.yaml`
- **Tool catalog:** `~/Projects/klevvr-konnects/docs/api/clio-mcp-tools.yaml` (1,138 tools, 46 categories)

---

*Added 2026-03-11 to reduce session-to-session rework.*
