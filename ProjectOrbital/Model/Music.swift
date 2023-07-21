//
//  Music.swift
//  Project
//
//  Created by Leandrea De Conceicao on 13/7/23.
//

import SwiftUI

struct Music: Identifiable {
    var id = UUID()
    var name: String
    var videoURL: URL
}

var musicData = [
    Music(name: "Yoga", videoURL: URL(string: "https://example.com/yoga")!),
    Music(name: "Meditation", videoURL: URL(string: "https://example.com/meditation")!),
    Music(name: "Exercise", videoURL: URL(string: "https://example.com/exercise")!),
    Music(name: "Breathing", videoURL: URL(string: "https://example.com/breathing")!)
]
