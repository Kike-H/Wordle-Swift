//
//  WordleApp.swift
//  Wordle
//
//  Created by Kike Hernandez D. on 27/08/22.
//

import SwiftUI

@main
struct WordleApp: App {
    @StateObject var csManager = ColorSchemeManager()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .onAppear {
                    csManager.applyColorScheme()
                }
        }
    }
}
