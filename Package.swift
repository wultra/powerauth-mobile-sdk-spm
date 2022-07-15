// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "PowerAuth2",
    platforms: [
        .iOS(.v9),
        .tvOS(.v9)
    ],
    products: [
        .library(name: "PowerAuth2", targets: ["PowerAuth2"]),
        .library(name: "PowerAuthCore", targets: ["PowerAuthCore"])
    ],
    targets: [
        .binaryTarget(
            name: "PowerAuth2",
            url: "https://github.com/wultra/powerauth-mobile-sdk-spm/releases/download/1.7.0/PowerAuth2-1.7.0.xcframework.zip",
            checksum: "71a510987887fa9aa54e3208ee9e262dba1ca3313bbebac1d6ad71cc089c6cd8"),
        .binaryTarget(
            name: "PowerAuthCore",
            url: "https://github.com/wultra/powerauth-mobile-sdk-spm/releases/download/1.7.0/PowerAuthCore-1.7.0.xcframework.zip",
            checksum: "9a6a416ed7983ac3e4d13c307ef22fc60fc2614442226af1fd76cdeca427f55a")
    ]
)