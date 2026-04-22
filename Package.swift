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
            url: "https://github.com/greathousesh/iOS_SDK/releases/download/v0.0.14/MySDK.xcframework.zip",
            checksum: "14ed9eddcc48895e12d35ef3122e75052c75bd66e5068fcc310c3b61f6f7b02d"
        )
    ]
)
