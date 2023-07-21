//
//  ChatView.swift
//  ProjectOrbital
//
//  Created by Leandrea De Conceicao on 15/7/23.
//

import SwiftUI

struct ChatView: View {
    var body: some View {
        VStack {
            Text("Chat with Friends")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding()
            
            ScrollView {
                LazyVStack(spacing: 16) {
                    ForEach(friends) { friend in
                        FriendChatRow(friend: friend)
                    }
                }
                .padding()
            }
        }
    }
}

struct FriendChatRow: View {
    var friend: Friend
    
    var body: some View {
        HStack {
            Image(friend.profileImageName)
                .resizable()
                .frame(width: 60, height: 60)
                .cornerRadius(30)
            
            VStack(alignment: .leading) {
                Text(friend.name)
                    .font(.headline)
                
                Text(friend.lastMessage)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            
            Spacer()
            
            Image(systemName: "message.fill")
                .foregroundColor(.blue)
        }
    }
}

struct Friend: Identifiable {
    var id = UUID()
    var name: String
    var lastMessage: String
    var profileImageName: String
}

let friends = [
    Friend(name: "Friend 1", lastMessage: "How are you feeling today?", profileImageName: "friend1"),
    Friend(name: "Friend 2", lastMessage: "Remember to practice self-care!", profileImageName: "friend2"),
    Friend(name: "Friend 3", lastMessage: "Have you tried journaling for mindfulness?", profileImageName: "friend3"),
    Friend(name: "Friend 4", lastMessage: "Let's meet up for a walk and talk.", profileImageName: "friend4"),
    Friend(name: "Friend 5", lastMessage: "Don't hesitate to reach out if you need support.", profileImageName: "friend5"),
    // Add more friends here...
]

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView()
    }
}
