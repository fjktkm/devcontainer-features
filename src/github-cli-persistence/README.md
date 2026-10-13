
# GitHub CLI Persistence (github-cli-persistence)

Persist GitHub CLI configuration across dev container rebuilds using a dedicated Docker volume with user or workspace scope.

## Example Usage

```json
"features": {
    "ghcr.io/fjktkm/devcontainer-features/github-cli-persistence:1": {}
}
```

## Options

| Options Id | Description | Type | Default Value |
|-----|-----|-----|-----|
| scope | Volume scope for config persistence. 'user': all devcontainers share one volume. 'workspace': each devcontainer gets its own volume (keyed by devcontainerId). | string | user |



---

_Note: This file was auto-generated from the [devcontainer-feature.json](https://github.com/fjktkm/devcontainer-features/blob/main/src/github-cli-persistence/devcontainer-feature.json).  Add additional notes to a `NOTES.md`._
