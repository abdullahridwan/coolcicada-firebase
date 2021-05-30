//
//  workoutAppApp.swift
//  Shared
//
//  Created by Abdullah Ridwan on 5/29/21.
//

import SwiftUI
import Firebase

@main
struct workoutAppApp: App {
    init(){
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
