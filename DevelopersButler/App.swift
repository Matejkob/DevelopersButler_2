import SwiftUI

@main
struct DevelopersButlerApp: App {
    @NSApplicationDelegateAdaptor(AppDelegate.self)
    private var appDelegate

    var body: some Scene {
        Settings(content: EmptyView.init)
    }
}
