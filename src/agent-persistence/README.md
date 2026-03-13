### **IMPORTANT NOTE**
- **Ids used to publish this Feature in the past - 'agent-creds'**

# Agent Persistence (agent-persistence)

Persist configurations for coding agents (Claude Code, Codex, Gemini Code Assist) and tools they commonly use (GitHub CLI) across dev container rebuilds using Docker volumes

## Example Usage

```json
"features": {
    "ghcr.io/fjktkm/devcontainer-features/agent-persistence:1": {}
}
```

## Options

| Options Id | Description | Type | Default Value |
|-----|-----|-----|-----|
| scope | Volume scope for agent config persistence. 'user': all devcontainers share one volume. 'workspace': each devcontainer gets its own volume (keyed by devcontainerId). | string | user |
| claude | Mount Claude Code config directory (~/.claude) via volume. | boolean | true |
| codex | Mount Codex config directory (~/.codex) via volume. | boolean | true |
| gemini | Mount Gemini Code Assist directories (~/.gemini, ~/.cache/google-vscode-extension, ~/.cache/cloud-code) via volumes. | boolean | true |
| github-cli | Mount GitHub CLI config directory (~/.config/gh) via volume. | boolean | true |



---

_Note: This file was auto-generated from the [devcontainer-feature.json](https://github.com/fjktkm/devcontainer-features/blob/main/src/agent-persistence/devcontainer-feature.json).  Add additional notes to a `NOTES.md`._
