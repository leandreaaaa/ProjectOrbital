//
//  MusicSection.swift
//  Project
//
//  Created by Leandrea De Conceicao on 13/7/23.
//

import SwiftUI

struct MusicSection: Identifiable {
    let id = UUID()
    let title: String
    let caption: String
    let audio: String
    let color: Color
}

let sections: [MusicSection] = [
    MusicSection(title: "Study Sessions", caption: "Listen to audio - 5 mins", audio: "audio-studysessions", color: .blue),
    MusicSection(title: "Managing Anxiety", caption: "Listen to audio - 5 mins", audio: "audio-relief", color: .pink),
    MusicSection(title: "Breathing Exercises", caption: "Listen to audio - 5 mins", audio: "audio-calming", color: .purple),
    MusicSection(title: "Soothing Music", caption: "Listen to audio - 5 mins", audio: "audio-classical", color: .yellow),
]

