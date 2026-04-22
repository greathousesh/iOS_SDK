import SwiftUI
import MySDK

// --- 应用主视图 ---

struct ContentView: View {
    @State private var sdkStatus: String = "未连接"
    private let sdkService = MySDKService()

    var body: some View {
        VStack(spacing: 40) {
            Text("独立示例 App")
                .font(.largeTitle)
                .fontWeight(.bold)

            VStack(spacing: 15) {
                Text("SDK 图片资源:")
                    .font(.caption)
                // 展示来自 SDK 二进制包的图片
                SDKImageView()
                    .frame(width: 120, height: 120)
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                    .shadow(radius: 5)
            }
            .padding()
            .background(Color.blue.opacity(0.1))
            .cornerRadius(20)

            VStack(alignment: .leading, spacing: 10) {
                Text("SDK 数据读取:")
                    .font(.headline)
                
                Text(sdkStatus)
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(Color.gray.opacity(0.1))
                    .font(.system(.body, design: .monospaced))
                    .cornerRadius(8)
            }
            .padding()

            Button("从 SDK 获取配置") {
                withAnimation {
                    sdkStatus = sdkService.readConfig()
                }
            }
            .buttonStyle(.borderedProminent)
            .controlSize(.large)
        }
        .padding()
    }
}

// --- App 入口 ---

@main
struct StandaloneExampleApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
