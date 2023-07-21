//
//  ResultsView.swift
//  ProjectOrbital
//
//  Created by Leandrea De Conceicao on 15/7/23.
//

import SwiftUI

struct ResultsView: View {
    let musicPodcastsListened: Int = 10
    let activitiesCompleted: Int = 15
    let moodLogStreak: Int = 7
    
    var body: some View {
        VStack {
            Text("Your Results")
                .font(.title)
                .fontWeight(.bold)
                .padding()
            
            VStack(spacing: 20) {
                ResultCardView(title: "Music Podcasts Listened", value: musicPodcastsListened)
                ResultCardView(title: "Activities Completed", value: activitiesCompleted)
                ResultCardView(title: "Mood Log Streak", value: moodLogStreak)
            }
            .padding()
            
            Spacer()
        }
    }
}

struct ResultCardView: View {
    let title: String
    let value: Int
    
    var body: some View {
        VStack {
            Text(title)
                .font(.headline)
                .fontWeight(.bold)
                .foregroundColor(.black)
            
            Text("\(value)")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(.blue)
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
        .shadow(color: Color.black.opacity(0.2), radius: 4, x: 0, y: 2)
    }
}

struct ResultsView_Previews: PreviewProvider {
    static var previews: some View {
        ResultsView()
    }
}
