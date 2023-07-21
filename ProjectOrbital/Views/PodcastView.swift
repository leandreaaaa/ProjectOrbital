//
//  PodcastView.swift
//  ProjectOrbital
//
//  Created by Leandrea De Conceicao on 15/7/23.
//

import SwiftUI

struct Podcast: Identifiable {
    let id = UUID()
    let title: String
    let host: String
    let image: String
    let description: String
}

struct PodcastView: View {
    let podcasts: [Podcast] = [
        Podcast(title: "Podcast Title 1", host: "Host 1", image: "podcast_image_1", description: "Description 1"),
        Podcast(title: "Podcast Title 2", host: "Host 2", image: "podcast_image_2", description: "Description 2"),
        Podcast(title: "Podcast Title 3", host: "Host 3", image: "podcast_image_3", description: "Description 3"),
        // Add more podcasts here...
    ]
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                ForEach(podcasts) { podcast in
                    PodcastCardView(podcast: podcast)
                }
            }
            .padding()
        }
    }
}

struct PodcastCardView: View {
    let podcast: Podcast
    
    var body: some View {
        VStack(alignment: .leading) {
            Image(podcast.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 200)
                .cornerRadius(10)
            
            Text(podcast.title)
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.black)
            
            Text("Hosted by \(podcast.host)")
                .font(.subheadline)
                .foregroundColor(.gray)
            
            Text(podcast.description)
                .font(.body)
                .foregroundColor(.black)
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
        .shadow(color: Color.black.opacity(0.2), radius: 4, x: 0, y: 2)
    }
}

struct PodcastView_Previews: PreviewProvider {
    static var previews: some View {
        PodcastView()
    }
}
