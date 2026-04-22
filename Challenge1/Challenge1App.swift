//
//  Challenge1App.swift
//  Challenge1
//
//  Created by 앤디 on 3/29/26.
//

import SwiftUI
import SwiftData

@main
struct Challenge1App: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: FavoriteSpot.self)
    }
}
