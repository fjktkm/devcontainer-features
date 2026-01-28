# Dev Container Features

A collection of dev container features for improving development workflow.

## `agent-creds`

Persist coding agent credentials (Claude Code, Codex and Gemini Code Assist) across dev container rebuilds using Docker volumes.

**Usage:** Add to VS Code User Settings (`settings.json`):

```json
{
  "dev.containers.defaultFeatures": {
    "ghcr.io/fjktkm/devcontainer-features/agent-creds:1": {}
  }
}
```

See [src/agent-creds/README.md](src/agent-creds/README.md) for more details.
