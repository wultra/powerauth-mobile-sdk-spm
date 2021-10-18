# PowerAuth mobile SDK for Swift PM

This repository contains build scripts that helps prepare [PowerAuth mobile SDK](https://github.com/wultra/powerauth-mobile-sdk) for integration with [Swift Package Manager](https://swift.org/package-manager). The repository also contains `Package.swift` file describing an actual PowerAuth mobile SDK releases for SPM.

## Usage

The [PowerAuth mobile SDK](https://github.com/wultra/powerauth-mobile-sdk) doesn't support Swift Package Manager directly. Instead of this, you have to add this repository as a package source. So add `https://github.com/wultra/powerauth-mobile-sdk-spm` repository as a package in Xcode UI and add `PowerAuth2` and `PowerAuthCore` libraries as a dependency.

Alternatively, you can add the dependency manually. For example:
```swift
// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "YourLibrary",
    platforms: [
        .iOS(.v9),
        .tvOS(.v9)
    ],
    products: [
        .library(
            name: "YourLibrary",
            targets: ["YourLibrary"]),
    ],
    dependencies: [
        .package(name: "PowerAuth2", url: "https://github.com/wultra/powerauth-mobile-sdk-spm.git", .from("1.6.2")),
        .package(name: "PowerAuthCore", url: "https://github.com/wultra/powerauth-mobile-sdk-spm.git", .from("1.6.2")),
    ],
    targets: [
        .target(
            name: "YourLibrary",
            dependencies: ["PowerAuth2", "PowerAuthCore"])
    ]
)
```

## Prepare new release

### Prerequisities

- Xcode 12.1 up to 12.5, configured as a default toolchain for Command Line Tools
- `jq` command, required by `deploy.sh`

### `deploy.sh`

The main deployment script that do the following tasks:

- Clone requested version into `sdk-sources` folder.
- Build `PowerAuth2.xcframework` and `PowerAuthCore.xcframework`.
- Prepare `Package.swift`.
- Push tagged version of `Package.swift` to git.
- Create release at github.com.
- Upload binary artifacts to just created library release. 

The usage of the script is simple, just specify a version of PowerAuth mobile SDK to prepare for SPM. For example:
```bash
$ ./deploy.sh 1.6.2
```

### `build.sh`

The build script is useful in case that you need to manually prepare XCFrameworks for manual library integration. The script does the following tasks:

- Clone requested version into `sdk-sources` folder.
- Build `PowerAuth2.xcframework` and `PowerAuthCore.xcframework`.
- The result is available in `frameworks` folder.

The usage of the script is simple, just specify a version of PowerAuth mobile SDK to build. For example:
```bash
$ ./build.sh 1.6.2
```
The result is stored in `frameworks` folder.

### Support scripts

The following support scripts are also present in the repository in `scripts` folder:

- `config.sh` - contains shared configuration for all scripts in this repository.
- `clone.sh` - allows clone PowerAuth mobile SDK at a specific version.
- `common-functions.sh` - a script with common functions, shared across various projects at Wultra.
- `github-client.sh` - github REST API client implementing release and release assets management. 