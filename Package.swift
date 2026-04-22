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
            url: "https://github.com/greathousesh/iOS_SDK/releases/download/v0.0.23/MySDK.xcframework.zip",
            checksum: "7a1eafe6ddaea6ec7c815ab171fa56dd53c593ddebdf3c176296fb40c6b76028"
        )
    ]
)
