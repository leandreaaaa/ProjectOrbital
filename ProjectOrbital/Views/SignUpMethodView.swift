//
//  SignUpMethodView.swift
//  Project
//
//  Created by Leandrea De Conceicao on 8/7/23.
//

import SwiftUI

struct SignUpMethodView: View {
    let method: SignUpMethod
    
    var body: some View {
        VStack {
            Text(method.title)
                .font(.title)
                .padding()
            
            Spacer()
            
            Image(method.logo)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100, height: 100)
                .padding()
            
            Spacer()
            
            Button(action: method.signUpAction) {
                Text("Sign up with \(method.title)")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(10)
            }
        }
    }
}

struct SignUpMethodView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpMethodView(method: SignUpMethod(title: "Apple", logo: "Logo Apple") {
            // Handle Apple sign up action
        })
    }
}

struct SignUpMethod: Identifiable {
    let id = UUID()
    var title: String
    var logo: String
    var signUpAction: () -> Void
}
