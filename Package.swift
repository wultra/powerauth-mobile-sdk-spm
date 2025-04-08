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
            url: "https://github.com/wultra/powerauth-mobile-sdk-spm/releases/download/1.8.5/PowerAuth2-1.8.5.xcframework.zip",
            checksum: "4681d61406bdf2814a04b367dfe6c038b983ec88593d26a0770b93cc4e2ae686"),
        .binaryTarget(
            name: "PowerAuthCore",
            url: "https://github.com/wultra/powerauth-mobile-sdk-spm/releases/download/1.8.5/PowerAuthCore-1.8.5.xcframework.zip",
            checksum: "a0b709fbe2c023a53648d5d4c768bf05361b447522587c678d475910936b357c")
    ]
)