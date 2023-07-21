//
//  MoodTrackerView.swift
//  Project
//
//  Created by Leandrea De Conceicao on 9/7/23.
//

import SwiftUI

struct MoodTrackerView: View {
    @State private var selectedMood: String = ""
    @State private var showConfirmation: Bool = false
    @State private var showMoodAnalysis: Bool = false
    
    let moods = ["😃", "😊", "😐", "😕", "😢", "😡"]
    
    var body: some View {
        NavigationView {
            ZStack {
                Color("Background").ignoresSafeArea()
                
                ScrollView {
                    content
                }
            }
        }
    }
    
    var content: some View {
        VStack(alignment: .center, spacing: 0) {
            VStack(alignment: .center, spacing: 0) {
                Spacer()
                
                Text("Mood Tracker")
                    .font(.custom("Poppins Bold", size: 38))
                    .frame(maxWidth: .infinity, alignment: .center)
                
                Text("How are you feeling today?")
                    .customFont(.subheadline)
                    .foregroundColor(.gray)
                    .padding(.top, 20)
            }
            .padding(.horizontal, 40)
            
            Spacer()
            
            LazyVGrid(columns: createGrid(), spacing: 5) {
                ForEach(moods, id: \.self) { mood in
                    MoodCard(mood: mood, isSelected: mood == selectedMood, onTap: selectMood)
                }
            }
            .padding()
            
            VStack {
                if !selectedMood.isEmpty {
                    Text("Selected Mood")
                        .customFont(.title3)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Text(selectedMood)
                        .customFont(.largeTitle)
                        .frame(maxWidth: .infinity, alignment: .center)
                }
            }
            .padding(20)
            
            Button(action: {
                showConfirmation = true
                navigateToMoodAnalysis()
            }) {
                NavigationLink(destination: MoodAnalysisView(), isActive: $showMoodAnalysis) {
                    EmptyView()
                }
                
                Button(action: {
                    showMoodAnalysis = true
                }) {
                    Text("Done")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.black)
                        .cornerRadius(10)
                }
            }
        }
    }


    
    func createGrid() -> [GridItem] {
        Array(repeating: GridItem(.flexible(), spacing: 20), count: 2)
    }
    
    func selectMood(_ mood: String) {
        selectedMood = mood
    }
    
    func navigateToMoodAnalysis() {
        showMoodAnalysis = true
    }
}

struct MoodCard: View {
    var mood: String
    var isSelected: Bool
    var onTap: (String) -> Void
    
    var body: some View {
        Text(mood)
            .font(.system(size: 80))
            .padding(20)
            .background(isSelected ? Color.black : Color.clear.opacity(0.4))
            .cornerRadius(10)
            .onTapGesture {
                onTap(mood)
            }
    }
}

struct MoodTrackerView_Previews: PreviewProvider {
    static var previews: some View {
        MoodTrackerView()
    }
}
