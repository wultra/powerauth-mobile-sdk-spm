// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "PowerAuth2",
    platforms: [
        .iOS(.v11),
        .tvOS(.v11)
    ],
    products: [
        .library(name: "PowerAuth2", targets: ["PowerAuth2"]),
        .library(name: "PowerAuthCore", targets: ["PowerAuthCore"])
    ],
    targets: [
        .binaryTarget(
            name: "PowerAuth2",
            url: "https://github.com/wultra/powerauth-mobile-sdk-spm/releases/download/1.9.2/PowerAuth2-1.9.2.xcframework.zip",
            checksum: "7b9a119adb374dd1eb50d5e7c3b57fb0ec626c2234c36730ac9c3a02189af4fc"),
        .binaryTarget(
            name: "PowerAuthCore",
            url: "https://github.com/wultra/powerauth-mobile-sdk-spm/releases/download/1.9.2/PowerAuthCore-1.9.2.xcframework.zip",
            checksum: "6ea97a98f5628d15b55d26637580f6a0355a2ad36e1b813729439002818fdd22")
    ]
)