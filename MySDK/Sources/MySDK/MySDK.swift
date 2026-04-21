import Foundation
import SwiftUI

/// Main entry point for the SDK, renamed from 'MySDK' to 'MySDKService'
/// to avoid namespace conflicts with the module name.
public struct MySDKService {
    public private(set) var text = "Hello, World!"

    public init() {}

    internal static var sdkBundle: Bundle {
        #if SWIFT_PACKAGE
        return Bundle.module
        #else
        let bundle = Bundle(for: BundleToken.self)
        if let resourceBundleURL = bundle.url(forResource: "MySDK_MySDK", withExtension: "bundle") {
            return Bundle(url: resourceBundleURL)!
        }
        return bundle
        #endif
    }

    public func readConfig() -> String {
        guard let url = MySDKService.sdkBundle.url(forResource: "config", withExtension: "json"),
              let data = try? Data(contentsOf: url),
              let jsonString = String(data: data, encoding: .utf8) else {
            return "Resource not found!"
        }
        return jsonString
    }
}

/// Private class to help locate the bundle in binary distributions
private class BundleToken {}

/// A SwiftUI view that displays an image from the SDK's internal resources.
public struct SDKImageView: View {
    public init() {}
    
    public var body: some View {
        VStack {
            Text("SDK Logo:")
                .font(.caption)
                .foregroundColor(.gray)
            
            Image("sdk_logo", bundle: MySDKService.sdkBundle)
                .resizable()
                .interpolation(.none)
                .frame(width: 50, height: 50)
                .border(Color.blue, width: 1)
                .cornerRadius(4)
        }
    }
}
