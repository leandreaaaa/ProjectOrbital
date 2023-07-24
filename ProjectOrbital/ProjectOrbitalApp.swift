//
//  ProjectOrbitalApp.swift
//  ProjectOrbital
//
//  Created by Leandrea De Conceicao on 14/7/23.
//

import SwiftUI
import Firebase

@main
struct ProjectOrbitalApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

    // Step 2: Create an @StateObject for the Authentication object
    @StateObject private var authentication = Authentication()

    var body: some Scene {
        WindowGroup {
            // Step 2: Provide the authentication object to the view hierarchy
            OnboardingView()
                .environmentObject(authentication)
        }
    }
}

