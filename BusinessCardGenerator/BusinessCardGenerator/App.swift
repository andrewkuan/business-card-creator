import SwiftUI

@main
struct BusinessCardGeneratorApp: App {
    var body: some Scene {
        WindowGroup {
            MainView()
        }
        .windowResizable()
        .windowStyle(.hiddenTitleBar)
        .defaultSize(width: 1024, height: 768)
    }
} 