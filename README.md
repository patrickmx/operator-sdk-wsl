# operator-sdk-wsl

Create a fresh wsl installation ready to work with the operator-sdk

## Archived

This repo is discontinued & archived

## Build & import (fedora35)

```powershell
Set-ExecutionPolicy -ExecutionPolicy Unrestricted -Scope Process
.\build-fedora35.ps1
```

## Notes

- The operator SDK requires a very recent go version (1.17+)
- Some commands fail when gcc is not installed
