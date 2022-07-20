import AppKit
import SwiftUI

final class AppDelegate: NSObject, NSApplicationDelegate {

    private var rootViewConfigurator: RootViewConfigurator?

    func applicationDidFinishLaunching(_ notification: Notification) {
        rootViewConfigurator = RootViewConfigurator()
    }
}
