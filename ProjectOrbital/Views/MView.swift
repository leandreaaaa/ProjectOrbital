//
//  MView.swift
//  Project
//
//  Created by Leandrea De Conceicao on 13/7/23.
//

import SwiftUI


struct MView: View {
    var body: some View {
        ScrollView (.vertical, showsIndicators: false) {
            VStack (alignment: .center) {
                Text("Listen")
                    .font(.custom("Poppins Bold", size: 38))
                    .frame(maxWidth: .infinity, alignment: .center)
                
                HStack (spacing: 24) {
                    VStack (spacing: 24) {
                        VStack (alignment: .leading) {
                            Text("Study Sessions")
                                .customFont(.title3)
                                .frame(maxWidth: 200, alignment: .center)
                                .foregroundColor(.primary)
                                .lineLimit(2) // Add lineLimit to make the text wrap into two lines if needed
                                .minimumScaleFactor(0.5) // Adjust the minimum scale factor to reduce the font size
                            Text("20 min")
                                .padding(.all, 6)
        
                            Image("pic1")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                        }
                        .padding()
                        .frame(width: 165, height: 250)
                        .background(Color(UIColor(red: 1, green: 0.89, blue: 0.83, alpha: 1)).opacity(0.2))
                        .cornerRadius(24)
                        
                        VStack (alignment: .leading) {
                            Text("Classical for Easing Stress")
                                .customFont(.title3)
                                .frame(maxWidth: 200, alignment: .center)
                                .foregroundColor(.primary)
                                .lineLimit(2) // Add lineLimit to make the text wrap into two lines if needed
                                .minimumScaleFactor(0.5) // Adjust the minimum scale factor to reduce the font size
                            Text("20 min")
                                .padding(.all, 6)
                                .background(Color.white)
                                .clipShape(Capsule())
                            Image("health")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                        }
                        .padding()
                        .frame(width: 165, height: 250)
                        .background(Color(UIColor(red: 0.91, green: 0.96, blue: 1, alpha: 1)).opacity(0.2))
                        .cornerRadius(24)
                    }
                    
                    VStack (spacing: 24) {
                        VStack (alignment: .leading) {
                            Text("Soothing Music to Release Anxiety")
                                .customFont(.title3)
                                .frame(maxWidth: 200, alignment: .center)
                                .foregroundColor(.primary)
                                .lineLimit(2) // Add lineLimit to make the text wrap into two lines if needed
                                .minimumScaleFactor(0.5) // Adjust the minimum scale factor to reduce the font size
                            Text("20 min")
                                .padding(.all, 6)
                                .background(Color.white)
                                .clipShape(Capsule())
                            Image("health")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                        }
                        .padding()
                        .frame(width: 165, height: 250)
                        .background(Color(UIColor(red: 0.91, green: 1, blue: 0.93, alpha: 1)).opacity(0.2))
                        .cornerRadius(24)
                        
                        VStack (alignment: .leading) {
                            Text("Piano for Deep Sleep")
                                .customFont(.title3)
                                .frame(maxWidth: 200, alignment: .center)
                                .foregroundColor(.primary)
                                .lineLimit(2) // Add lineLimit to make the text wrap into two lines if needed
                                .minimumScaleFactor(0.5) // Adjust the minimum scale factor to reduce the font size
                            Text("20 min")
                                .padding(.all, 6)
                                .background(Color.white)
                                .clipShape(Capsule())
                            Image("health")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                        }
                        .padding()
                        .frame(width: 165, height: 250)
                        .background(Color(UIColor(red: 1, green: 0.91, blue: 0.93, alpha: 1)).opacity(0.2))
                        .cornerRadius(24)
                    }
                }
                .padding(.vertical)
            }
            .padding()
        }
        .background(Color(red: 0.95, green: 0.91, blue: 1))
    }
}

struct MView_Previews: PreviewProvider {
    static var previews: some View {
        MView()
    }
}


//
//var body: some View {
//    VStack(alignment: .center, spacing: 20) {
//        Text(musicSection.title)
//            .customFont(.title3)
//            .frame(maxWidth: 200, alignment: .center)
//            .foregroundColor(.primary)
//            .lineLimit(2) // Add lineLimit to make the text wrap into two lines if needed
//            .minimumScaleFactor(0.5) // Adjust the minimum scale factor to reduce the font size
//
//        Image(systemName: "play.circle.fill")
//            .resizable()
//            .aspectRatio(contentMode: .fit)
//            .frame(width: 44, height: 44)
//            .padding(10)
//            .onTapGesture {
//                playAudio()
//            }
//    }
//    .foregroundColor(.white)
//    .padding(30)
//    .frame(width: 160, height: 200)
//    .background(.linearGradient(colors: [musicSection.color.opacity(1), musicSection.color.opacity(0.5)], startPoint: .topLeading, endPoint: .bottomTrailing))
//
//    .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
//    .shadow(color: musicSection.color.opacity(0.3), radius: 8, x: 0, y: 12)
//    .shadow(color: musicSection.color.opacity(0.3), radius: 2, x: 0, y: 1)
//}
//
//func playAudio() {
//    guard let audioURL = Bundle.main.url(forResource: musicSection.audio, withExtension: "mp3") else {
//        return
//    }
//
//    do {
//        audioPlayer = try AVAudioPlayer(contentsOf: audioURL)
//        audioPlayer?.play()
//    } catch {
//        print("Failed to play audio: \(error.localizedDescription)")
//    }
//}
//}
//
//struct MusicSectionCard_Previews: PreviewProvider {
//static var previews: some View {
//    MusicSectionCard(musicSection: sections[1])
//        .previewLayout(.sizeThatFits)
//}
//}
