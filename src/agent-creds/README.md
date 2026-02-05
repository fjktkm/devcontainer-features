
# Agent Credentials (agent-creds)

Persist coding agent credentials (Claude Code, Codex, Gemini Code Assist, GitHub CLI) across dev container rebuilds using Docker volumes

## Example Usage

```json
"features": {
    "ghcr.io/fjktkm/devcontainer-features/agent-creds:1": {}
}
```

## Options

| Options Id | Description | Type | Default Value |
|-----|-----|-----|-----|
| claude | Mount Claude Code config (`~/.claude`) via volume. | boolean | true |
| codex | Mount Codex config (`~/.codex`) via volume. | boolean | true |
| gemini | Mount Gemini Code Assist config (`~/.gemini`) and caches (`~/.cache/google-vscode-extension`, `~/.cache/cloud-code`) via volumes. | boolean | true |
| github-cli | Mount GitHub CLI config (`~/.config/gh`) via volume. | boolean | true |



---

_Note: This file was auto-generated from the [devcontainer-feature.json](https://github.com/fjktkm/devcontainer-features/blob/main/src/agent-creds/devcontainer-feature.json).  Add additional notes to a `NOTES.md`._
