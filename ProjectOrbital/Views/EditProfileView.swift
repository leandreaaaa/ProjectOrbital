//
//  EditProfileView.swift
//  Project
//
//  Created by Leandrea De Conceicao on 14/7/23.
//

import SwiftUI

struct EditProfileView: View {
    @State private var username = ""
    @State private var email = ""
    
    var body: some View {
        VStack(spacing: 24) {
            Text("Edit Profile")
                .font(.custom("Poppins-Bold", size: 38))
                .frame(maxWidth: .infinity, alignment: .center)
            
            VStack(alignment: .leading) {
                Text("Username")
                    .customFont(.subheadline)
                    .foregroundColor(.secondary)
                TextField("", text: $email)
                    .customTextField(image: Image("Icon Lock"))
            }
            VStack(alignment: .leading) {
                Text("Email")
                    .customFont(.subheadline)
                    .foregroundColor(.secondary)
                SecureField("", text: $email)
                    .customTextField(image: Image("Icon Email"))
            }
            
            Button(action: {
                // Handle edit profile button action
                editProfile()
            }) {
                HStack {
                    Image(systemName: "arrow.right")
                    Text("Change Password")
                        .customFont(.subheadline)
                }
                .foregroundColor(.secondary)
                .padding() // Add padding here
            }
            
            Button(action: {
                // Handle save button action
                saveChanges()
            }) {
                Text("Save Changes")
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding()
                    .background(Color.black)
                    .cornerRadius(10)
            }
            .padding(.horizontal, 10)
        }
        .padding(.horizontal, 20)
        .padding(.vertical, 60)
        .background(.regularMaterial)
        .mask(RoundedRectangle(cornerRadius: 20, style: .continuous))
        .shadow(color: Color("Shadow").opacity(0.3), radius: 5, x: 0, y: 3)
        .shadow(color: Color("Shadow").opacity(0.3), radius: 30, x: 0, y: 30)
        .overlay(
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .stroke(.linearGradient(colors: [.white.opacity(0.8), .white.opacity(0.1)], startPoint: .topLeading, endPoint: .bottomTrailing))
        )
        .padding(.horizontal, 30)
    }
    
    func editProfile() {
        // Handle edit profile action
    }
    
    func saveChanges() {
        // Perform the necessary validation here
        guard !username.isEmpty && !email.isEmpty else {
            // Display an error message for an empty name
            return
        }
        
        // Update the user's profile data with the updated values
        // For demonstration purposes, we will print the updated values
        print("Username: \(username)")
        print("Email: \(email)")
    }
    
    func customTextField(placeholder: String, imageName: String, text: Binding<String>) -> some View {
        HStack {
            Image(systemName: imageName)
                .foregroundColor(.secondary)
            TextField(placeholder, text: text)
                .foregroundColor(.primary)
                .textFieldStyle(RoundedBorderTextFieldStyle())
        }
        .padding()
    }
}

struct EditProfileView_Previews: PreviewProvider {
    static var previews: some View {
        EditProfileView()
    }
}
