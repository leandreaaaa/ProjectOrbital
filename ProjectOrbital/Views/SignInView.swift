//
//  SignInView.swift
//  Project
//
//  Created by Leandrea De Conceicao on 8/7/23.
//

import SwiftUI
import RiveRuntime

struct SignInView: View {
    
    @State private var email = ""
    @State private var password = ""
    @State private var isLoading = false
    @Binding var show: Bool
    
    let confetti = RiveViewModel(fileName: "confetti", stateMachineName: "State Machine 1")
    let check = RiveViewModel(fileName: "check", stateMachineName: "State Machine 1")
    
    let authenticationService = AuthenticationService()
    
    var signUpMethods: [SignUpMethod] = [
        SignUpMethod(title: "Email", logo: "Logo Email") {
            // Handle Email sign up action
        },
        SignUpMethod(title: "Apple", logo: "Logo Apple") {
            // Handle Apple sign up action
        },
        SignUpMethod(title: "Google", logo: "Logo Google") {
            // Handle Google sign up action
        }
    ]
    
    func logIn() {
        isLoading = true
        
        let credentials = UserCredentials(email: email, password: password)
        
        authenticationService.authenticateUser(credentials: credentials) { isAuthenticated in
            DispatchQueue.main.async {
                if isAuthenticated {
                    try? check.triggerInput("Check")
                    DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                        try? confetti.triggerInput("Trigger explosion")
                        withAnimation {
                            isLoading = false
                            show.toggle()
                        }
                    }
                } else {
                    try? check.triggerInput("Error")
                    DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                        isLoading = false
                    }
                }
            }
        }
    }
    
    var body: some View {
        VStack(spacing: 24) {
            Text("Login")
                .customFont(.largeTitle)
            
            VStack(alignment: .leading) {
                Text("Email")
                    .customFont(.subheadline)
                    .foregroundColor(.secondary)
                TextField("", text: $email)
                    .customTextField(image: Image("Icon Email"))
            }
            VStack(alignment: .leading) {
                Text("Password")
                    .customFont(.subheadline)
                    .foregroundColor(.secondary)
                SecureField("", text: $password)
                    .customTextField(image: Image("Icon Lock"))
            }
            Button(action: logIn) {
                HStack {
                    Image(systemName: "arrow.right")
                    Text("Log in")
                        .customFont(.headline)
                }
                .padding() // Add padding here
            }
            
            HStack {
                Rectangle().frame(height: 1).opacity(0.1)
                Text("OR").customFont(.subheadline2).foregroundColor(.black.opacity(0.3))
                Rectangle().frame(height: 1).opacity(0.1)
            }
            
            Text("Sign up with Email, Apple, Google")
                .customFont(.subheadline)
                .foregroundColor(.secondary)
            
            HStack {
                ForEach(signUpMethods) { method in
                    Button(action: method.signUpAction) {
                        Image(method.logo)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 40, height: 40)
                    }
                }
            }
        }
        .padding(30)
        .background(.regularMaterial)
        .mask(RoundedRectangle(cornerRadius: 20, style: .continuous))
        .shadow(color: Color("Shadow").opacity(0.3), radius: 5, x: 0, y: 3)
        .shadow(color: Color("Shadow").opacity(0.3), radius: 30, x: 0, y: 30)
        .overlay(
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .stroke(.linearGradient(colors: [.white.opacity(0.8), .white.opacity(0.1)], startPoint: .topLeading, endPoint: .bottomTrailing))
        )
        .overlay(
            ZStack {
                if isLoading {
                    check.view()
                        .frame(width: 100, height: 100)
                        .allowsHitTesting(false)
                }
                confetti.view()
                    .scaleEffect(3)
                    .allowsHitTesting(false)
            }
        )
        .padding(40)
        .padding(.top, 40)
        .background(
            RiveViewModel(fileName: "shapes").view()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .ignoresSafeArea()
                .blur(radius: 100)
                .blendMode(.hardLight)
        )
        .background(
            Image("Spline")
                .blur(radius: 60)
                .offset(x: 10, y: 200)
        )
    }
}


struct UserCredentials {
    var email: String
    var password: String
}

struct AuthenticationService {
    func authenticateUser(credentials: UserCredentials, completion: @escaping (Bool) -> Void) {
        // Simulate authentication with hardcoded credentials for demonstration purposes
        let validEmail = "user@example.com"
        let validPassword = "password"
        
        let isAuthenticated = (credentials.email == validEmail && credentials.password == validPassword)
        completion(isAuthenticated)
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView(show: .constant(true))
    }
}
