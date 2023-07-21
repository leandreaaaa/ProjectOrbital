//
//  ActivityPageView.swift
//  ProjectOrbital
//
//  Created by Leandrea De Conceicao on 15/7/23.
//

import SwiftUI

struct Activity: Identifiable {
    let id = UUID()
    let title: String
    let description: String
    let imageName: String
}

struct ActivityPageView: View {
    let activities: [Activity] = [
        Activity(title: "Meditation", description: "Practice mindfulness and meditation to calm your mind.", imageName: "meditation"),
        Activity(title: "Deep Breathing", description: "Take deep breaths to relax your body and reduce stress.", imageName: "deep_breathing"),
        Activity(title: "Nature Walk", description: "Go for a walk in nature and connect with the natural environment.", imageName: "nature_walk"),
        // Add more activities here...
    ]
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                Text("Recommended Activities")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.primary)
                    .padding(.top, 30)
                
                ForEach(activities) { activity in
                    ActivityCard(activity: activity)
                }
                
                Spacer()
            }
            .padding()
        }
        .background(Color("Background").edgesIgnoringSafeArea(.all))
    }
}

struct ActivityCard: View {
    let activity: Activity
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Image(activity.imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 200)
                .cornerRadius(10)
            
            VStack(alignment: .leading, spacing: 8) {
                Text(activity.title)
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.primary)
                
                Text(activity.description)
                    .font(.body)
                    .foregroundColor(.secondary)
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
        .shadow(color: Color.black.opacity(0.2), radius: 6, x: 0, y: 3)
    }
}

struct ActivityPageView_Previews: PreviewProvider {
    static var previews: some View {
        ActivityPageView()
    }
}
