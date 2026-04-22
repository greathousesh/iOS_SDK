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
            url: "https://github.com/greathousesh/iOS_SDK/releases/download/v0.0.12/MySDK.xcframework.zip",
            checksum: "ae446a765b707e4e966b8c52c6d01b91d2f7b6c53c6d0bff78600d142d298a39"
        )
    ]
)
