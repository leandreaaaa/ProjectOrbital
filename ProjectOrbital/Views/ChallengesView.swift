//
//  ChallengesView.swift
//  ProjectOrbital
//
//  Created by Leandrea De Conceicao on 15/7/23.
//

import SwiftUI

struct Challenge: Identifiable {
    let id = UUID()
    let title: String

    var progress: Double
}

struct ChallengesView: View {
    @State private var challenges: [Challenge] = [
        Challenge(title: "Practice Mindfulness", progress: 0.75),
        Challenge(title: "Write in a Gratitude Journal", progress: 0.5),
        Challenge(title: "Exercise for 30 Minutes", progress: 0.2),
        // Add more challenges here...
    ]
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Daily Challenges")
                .font(.title)
                .fontWeight(.bold)
            
            ForEach(challenges) { challenge in
                ChallengeRow(challenge: challenge)
            }
            
            Spacer()
        }
        .padding()
    }
}

struct ChallengeRow: View {
    let challenge: Challenge
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(challenge.title)
                .font(.headline)
                .fontWeight(.bold)
            
            ProgressView(value: challenge.progress, total: 1.0)
                .accentColor(.blue)
                .frame(height: 10)
            
            Text(String(format: "%.0f%%", challenge.progress * 100))
                .font(.caption)
                .foregroundColor(.gray)
        }
    }
}

struct ChallengesView_Previews: PreviewProvider {
    static var previews: some View {
        ChallengesView()
    }
}
