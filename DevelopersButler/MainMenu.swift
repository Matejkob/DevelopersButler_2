import AppKit

final class MainMenu: NSMenu {
    private var derivedDataDirectory: String {
        ((try? FileManager.default.url(
            for: .libraryDirectory,
            in: .userDomainMask,
            appropriateFor: nil,
            create: false
        )
            .absoluteString) ?? "")
        .replacingOccurrences(of: "file://", with: "")
        .appending("Developer/Xcode/DerivedData")
    }

    override init(title: String) {
        super.init(title: title)
        addDerivedDataMenu()
    }

    @available(*, unavailable)
    required init(coder: NSCoder) { fatalError() }

    private func addDerivedDataMenu() {
        let derivedDataDirectoriesMenu = NSMenu()

        try? FileManager.default
            .contentsOfDirectory(atPath: derivedDataDirectory)
            .forEach { directory in
                let subitem = NSMenuItem()
                subitem.title = directory
                subitem.image = NSImage(
                    systemSymbolName: "trash",
                    accessibilityDescription: nil
                )
                subitem.target = self
                subitem.action = #selector(itemTapped(_:))
                derivedDataDirectoriesMenu.addItem(subitem)
            }

        let derivedDataMenuItem = NSMenuItem()
        derivedDataMenuItem.title = "DerivedData"
        derivedDataMenuItem.image = NSImage(
            systemSymbolName: "folder.badge.minus",
            accessibilityDescription: nil
        )

        addItem(derivedDataMenuItem)
        setSubmenu(derivedDataDirectoriesMenu, for: derivedDataMenuItem)
    }

    @objc private func itemTapped(_ menuItem: NSMenuItem) {
        try? FileManager.default
            .removeItem(
                atPath: derivedDataDirectory + "/\(menuItem.title)"
            )

        removeAllItems()
        addDerivedDataMenu()
    }
}
