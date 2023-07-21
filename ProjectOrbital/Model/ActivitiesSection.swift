//
//  ActivitiesSection.swift
//  Project
//
//  Created by Leandrea De Conceicao on 13/7/23.
//

import SwiftUI

struct ActivitiesSection: Identifiable {
    let id = UUID()
    let title: String
    let caption: String
    let audio: String
    let color: Color
}

let activitySections: [ActivitiesSection] = [
    ActivitiesSection(title: "Managing Anxiety", caption: "Read resources - 20 mins", audio: "audio-studysessions", color: .blue),
    ActivitiesSection(title: "Stretching with Martha", caption: "Listen to audio - 15 mins", audio: "audio-studysessions", color: .pink),
    ActivitiesSection(title: "Deep Breathing exercises", caption: "Watch tutorial - 10 mins", audio: "audio-studysessions", color: .purple),
    ActivitiesSection(title: "Meditation for Beginners", caption: "Watch tutorial - 15 mins", audio: "audio-studysessions",  color: .yellow),
]
