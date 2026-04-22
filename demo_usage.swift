import SwiftUI
import MySDK

// --- 示例代码：如何导入并使用 MySDK ---

struct MySDKUsageDemo: View {
    @State private var sdkConfig: String = "未加载"
    private let sdkService = MySDKService() // 初始化 SDK 服务

    var body: some View {
        NavigationView {
            VStack(spacing: 30) {
                // 1. 使用 SDK 提供的图片组件 (来自 SDK 内部资源)
                VStack {
                    Text("SDK 资源展示")
                        .font(.headline)
                    SDKImageView()
                        .frame(width: 100, height: 100)
                        .cornerRadius(15)
                        .shadow(radius: 5)
                }
                .padding()
                .background(Color.blue.opacity(0.1))
                .cornerRadius(20)

                // 2. 调用 SDK 的业务逻辑 (读取配置)
                VStack(alignment: .leading, spacing: 10) {
                    Text("SDK 业务功能")
                        .font(.headline)
                    
                    Text("当前配置信息:")
                        .font(.caption)
                        .foregroundColor(.secondary)
                    
                    Text(sdkConfig)
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(Color.gray.opacity(0.1))
                        .font(.system(.body, design: .monospaced))
                        .cornerRadius(8)
                }
                .padding()

                // 3. 交互按钮
                Button(action: {
                    withAnimation {
                        sdkConfig = sdkService.readConfig()
                    }
                }) {
                    Label("获取 SDK 配置", systemImage: "arrow.clockwise.circle.fill")
                        .padding()
                        .frame(maxWidth: .infinity)
                }
                .buttonStyle(.borderedProminent)
                .padding(.horizontal)

                Spacer()
            }
            .navigationTitle("MySDK 演示")
            .padding()
            .onAppear {
                sdkConfig = sdkService.readConfig()
            }
        }
    }
}

// --- 集成步骤说明 ---
/*
 步骤 1: 在你的项目中选择 File > Add Package Dependencies...
 步骤 2: 输入仓库地址: https://github.com/greathousesh/iOS_SDK.git
 步骤 3: 在代码顶部添加: import MySDK
 步骤 4: 直接调用 MySDKService() 或 SDKImageView()
*/
