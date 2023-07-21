////
////  StudySessionsView.swift
////  Project
////
////  Created by Leandrea De Conceicao on 14/7/23.
////
//
//import SwiftUI
//import AVKit
//
//struct Song {
//    // Song properties
//    var isFavorite: Bool
//    // ...
//}
//
//struct StudySessionsView: View {
//    @State private var isPlaying = false
//    @State private var timeElapsed: TimeInterval = 0
//    @State private var isLiked = false
//    @State private var player: AVPlayer?
//    @State private var song: Song = Song(isFavorite: false)
//    
//    var body: some View {
//        VStack {
//            HStack {
//                Spacer()
//                Menu {
//                    Button(action: {
//                        // Navigate to queued songs
//                    }) {
//                        Label("Queued Songs", systemImage: "list.bullet")
//                    }
//                } label: {
//                    Image(systemName: "ellipsis.circle")
//                        .font(.system(size: 24))
//                        .foregroundColor(.black)
//                }
//            }
//            .padding(.horizontal)
//            
//            Text("Now Playing")
//                .font(.custom("Poppins Bold", size: 38))
//                .frame(maxWidth: .infinity, alignment: .center)
//                .foregroundColor(.black)
//                .padding(.top, 40)
//            
//            Spacer()
//            
//            Image("album_cover")
//                .resizable()
//                .aspectRatio(contentMode: .fit)
//                .frame(width: 250, height: 250)
//                .cornerRadius(15)
//            
//            Spacer()
//            
//            Text("Song Title")
//                .font(.title)
//                .fontWeight(.bold)
//                .foregroundColor(.black)
//            
//            Text("Artist")
//                .font(.subheadline)
//                .foregroundColor(.gray)
//            
//            Spacer()
//            
//            HStack {
//                
//                Button(action: {
//                    subtract10Seconds()
//                }) {
//                    Image(systemName: "gobackward.10")
//                        .font(.system(size: 30))
//                        .foregroundColor(.black)
//                }
//                
//                
//                Button(action: {
//                    add10Seconds()
//                }) {
//                    Image(systemName: "goforward.10")
//                        .font(.system(size: 30))
//                        .foregroundColor(.black)
//                }
//                
//                Button(action: nextButtonTapped) {
//                    Image(systemName: "forward.fill")
//                        .font(.system(size: 40))
//                        .foregroundColor(.black)
//                }
//            }
//            .padding(.horizontal, 30)
//            
//            Spacer()
//                .padding(.bottom, 30)
//        }
//        .padding()
//        .background(LinearGradient(gradient: Gradient(colors: [Color("pastelPink"), Color("pastelPink2")]), startPoint: .top, endPoint: .bottom))
//    }
//    
//        
//        if isPlaying {
//            // Check if player is already created
//            if player == nil {
//                // Initialize the player with your audio source
//                if let url = URL(string: "https://example.com/yoga") {
//                    let playerItem = AVPlayerItem(url: url)
//                    player = AVPlayer(playerItem: playerItem)
//                }
//            }
//            
//            // Play audio
//            player?.play()
//        } else {
//            // Pause audio
//            player?.pause()
//        }
//    }
//    
//    
//    func nextButtonTapped() {
//        // Handle next song logic
//    }
//    
//    func add10Seconds() {
//        guard let player = player else { return }
//        let currentTime = player.currentTime()
//        let targetTime = CMTimeAdd(currentTime, CMTime(seconds: 10, preferredTimescale: 1000))
//        player.seek(to: targetTime)
//    }
//    
//    func subtract10Seconds() {
//        guard let player = player else { return }
//        let currentTime = player.currentTime()
//        let targetTime = CMTimeSubtract(currentTime, CMTime(seconds: 10, preferredTimescale: 1000))
//        player.seek(to: targetTime)
//    }
//}
//
//   
//
//struct StudySessionsView_Previews: PreviewProvider {
//    static var previews: some View {
//        StudySessionsView()
//    }
//}
