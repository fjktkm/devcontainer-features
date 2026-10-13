# Dev Container Features

A collection of dev container features for improving development workflow.

## `agent-persistence`

Install all four persistence Features (Claude Code, Codex, Gemini and GitHub CLI), each with its own Docker volumes. This Feature has no options and uses the default `user` scope. To select tools or use `workspace` scope, add the individual Features below.

**Usage:** Add to VS Code User Settings (`settings.json`):

```json
{
  "dev.containers.defaultFeatures": {
    "ghcr.io/fjktkm/devcontainer-features/agent-persistence:2": {}
  }
}
```

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
