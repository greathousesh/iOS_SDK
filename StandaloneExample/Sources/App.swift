import SwiftUI
import MySDK

struct ContentView: View {
    @State private var sdkStatus: String = "未连接"
    private let sdkService = MySDKService()

    var body: some View {
        VStack(spacing: 40) {
            Text("全新 Standalone Demo")
                .font(.title)
                .fontWeight(.bold)

            SDKImageView()
                .frame(width: 150, height: 150)
                .cornerRadius(20)
                .shadow(radius: 10)

            Text(sdkStatus)
                .padding()
                .background(Color.secondary.opacity(0.1))
                .cornerRadius(10)

            Button("从 SDK 读取数据") {
                sdkStatus = sdkService.readConfig()
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
    }
}

@main
struct StandaloneExampleApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
