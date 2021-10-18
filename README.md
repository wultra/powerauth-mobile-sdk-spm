# PowerAuth mobile SDK for Swift PM

This repository contains build scripts that helps prepare [PowerAuth mobile SDK](https://github.com/wultra/powerauth-mobile-sdk) for integration with [Swift Package Manager](https://swift.org/package-manager). The repository also contains a package descriptions mapping PowerAuth mobile SDK releases.

## SPM Integration

## Usage

### Prerequisities

- Xcode 12.1 up to 12.5, configured as a default toolchain for Command Line Tools

### `build.sh`

### `deploy.sh`

### Support scripts

The following support scripts are also present in the repository:

- `config.sh` - contains shared configuration for all scripts in this repository.
- `clone.sh` - allows clone PowerAuth mobile SDK at a specific version.
- `common-functions.sh` - a script with common functions, shared across various projects at Wultra.
- `github-client.sh` - github REST API client implementing release and release assets management. 