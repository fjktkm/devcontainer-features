# Dev Container Features

A collection of dev container features for improving development workflow.

## `agent-persistence`

Persist configurations for coding agents (Claude Code, Codex, Gemini Code Assist) and tools they commonly use (GitHub CLI) across dev container rebuilds using Docker volumes.

**Usage:** Add to VS Code User Settings (`settings.json`):

```json
{
  "dev.containers.defaultFeatures": {
    "ghcr.io/fjktkm/devcontainer-features/agent-persistence:1": {}
  }
}
```

See [src/agent-persistence/README.md](src/agent-persistence/README.md) for more details.

## Selected tools

Add only the Features you need, for example:

```json
"features": {
    "ghcr.io/fjktkm/devcontainer-features/codex-persistence:1": {},
    "ghcr.io/fjktkm/devcontainer-features/github-cli-persistence:1": {}
}
```

| Feature | Persisted directories |
| --- | --- |
| `codex-persistence` | `~/.codex` |
| `claude-persistence` | `~/.claude` |
| `gemini-persistence` | `~/.gemini`, `~/.cache/google-vscode-extension`, `~/.cache/cloud-code` |
| `github-cli-persistence` | `~/.config/gh` |

Individual tool Features support `scope`:

- `user` (default): share configuration between containers on the same Docker host.
- `workspace`: separate configuration by `devcontainerId`.

For example:

```json
"features": {
    "ghcr.io/fjktkm/devcontainer-features/codex-persistence:1": {
        "scope": "workspace"
    }
}
```
