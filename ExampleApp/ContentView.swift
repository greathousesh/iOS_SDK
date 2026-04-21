import SwiftUI
import MySDK

struct ContentView: View {
    @State private var sdkConfig: String = "Loading config..."

    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Welcome to the Example App!")
                .font(.headline)

            // Displaying the SDK Image View
            SDKImageView()
                .padding()

            VStack(alignment: .leading, spacing: 10) {
                Text("SDK Internal Config:")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                
                Text(sdkConfig)
                    .padding()
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(8)
                    .font(.system(.body, design: .monospaced))
            }
            .padding()

            Button("Refresh Config") {
                // Using the renamed MySDKService instead of MySDK
                sdkConfig = MySDKService().readConfig()
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
        .onAppear {
            // Using the renamed MySDKService instead of MySDK
            sdkConfig = MySDKService().readConfig()
        }
    }
}

#Preview {
    ContentView()
}
