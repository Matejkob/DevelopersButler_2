import SwiftUI

final class RootViewConfigurator: NSObject {
    private var statusBar: NSStatusBar
    private var statusItem: NSStatusItem

    override init() {
        statusBar = NSStatusBar.system
        statusItem = statusBar.statusItem(withLength: NSStatusItem.squareLength)

        super.init()

        if let statusBarButton = statusItem.button {
            statusBarButton.image = NSImage(
                systemSymbolName: "hammer.fill",
                accessibilityDescription: nil
            )
        }

        statusItem.menu = MainMenu()
    }
}
