//
//  SocialcademyApp.swift
//  Socialcademy
//
//  Created by Alex Archer on 8/8/23.
//

// This Portfolio Project encompasses concepts from modules fifteen through seventeen.


import SwiftUI
import Firebase

@main
struct SocialcademyApp: App {
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            AuthView()
        }
    }
}
