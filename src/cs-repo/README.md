
# Local CS Debian Repository (cs-repo)

Configure local debian repository

## Example Usage

```json
"features": {
    "ghcr.io/lvm-1896/features-dshr/cs-repo:1": {}
}
```

## Options

| Options Id | Description | Type | Default Value |
|-----|-----|-----|-----|
| uris | Choose main repo server. | string | http://archive.ubuntu.com/ubuntu |
| suites | Choose suites for activation. | string | stable testing unstable experimental |



---

_Note: This file was auto-generated from the [devcontainer-feature.json](https://github.com/lvm-1896/features-dshr/blob/main/src/cs-repo/devcontainer-feature.json).  Add additional notes to a `NOTES.md`._
