//
//  Course.swift
//  AnimatedApp
//
//  Created by Meng To on 2022-04-14.
//

import SwiftUI

struct Course: Identifiable {
    var id = UUID()
    var title: String
    var subtitle: String
    var caption: String
    var color: Color
    var image: Image
}

var courses = [
    Course(title: "Activities", subtitle: "Unlock a world of activities designed to uplift and support your mental health", caption: "20 sections - 3 hours", color: Color(hex: "7850F0"), image: Image("Topic 1")),
    Course(title: "Music", subtitle: "Immerse yourself in a treasure trove of music, carefully curated to improve your mood", caption: "47 sections - 11 hours", color: Color(hex: "6792FF"), image: Image("Topic 2")),
    Course(title: "Mood Tracker", subtitle: "Take control of your daily emotions with our mood selection feature", caption: "3 mins", color: Color(hex: "005FE7"), image: Image("Topic 1")),
    Course(title: "Journalling", subtitle: "Unleash your thoughts and emotions with our daily journaling function, empowering you to capture and reflect on your feelings", caption: "5-10 mins", color: Color(hex: "005FE7"), image: Image("Topic 4"))
]
