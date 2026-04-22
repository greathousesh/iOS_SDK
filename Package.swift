// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "MySDK",
    platforms: [
        .iOS(.v15)
    ],
    products: [
        .library(
            name: "MySDK",
            targets: ["MySDK"]
        ),
    ],
    targets: [
        .binaryTarget(
            name: "MySDK",
            url: "https://github.com/greathousesh/iOS_SDK/releases/download/v0.0.11/MySDK.xcframework.zip",
            checksum: "eea7e821a4b3c478b6d40cde35bed3328358eed8db0acac280e4e671f3d63321"
        )
    ]
)
