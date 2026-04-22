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
            url: "https://github.com/greathousesh/iOS_SDK/releases/download/v0.0.17/MySDK.xcframework.zip",
            checksum: "6cd9f3cfa32e2ee807c425890e71498cd9b5aa9f9b3018dc654feb60baaac380"
        )
    ]
)
