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
    
    var body: some Scene {
        WindowGroup {
            OnboardingView()
        }
    }
}


