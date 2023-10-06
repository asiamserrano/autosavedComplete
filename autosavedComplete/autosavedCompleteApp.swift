//
//  autosavedCompleteApp.swift
//  autosavedComplete
//
//  Created by Asia Serrano on 10/6/23.
//

import Foundation
import SwiftUI

public let appScreenWidth: CGFloat = UIScreen.main.bounds.width
public let appScreenHeight: CGFloat = UIScreen.main.bounds.height
public let appDefaultColor: Color = .blue
public let appSecondaryColor: Color = .pink

@main
struct autosavedCompleteApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
