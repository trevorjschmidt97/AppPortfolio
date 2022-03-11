//
//  AppPortfolioApp.swift
//  AppPortfolio
//
//  Created by Trevor Schmidt on 3/3/22.
//

import SwiftUI
import Firebase

@main
struct AppPortfolioApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .navigationViewStyle(.stack)
        }
    }
}
