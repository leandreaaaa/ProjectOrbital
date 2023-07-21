import SwiftUI
import AVFoundation

struct MusicSectionCard: View {
    
    let musicSection: MusicSection
    @State private var audioPlayer: AVAudioPlayer?
    
    var body: some View {
        VStack(alignment: .center, spacing: 20) {
            Text(musicSection.title)
                .customFont(.title3)
                .frame(maxWidth: 200, alignment: .center)
                .foregroundColor(.primary)
                .lineLimit(2) // Add lineLimit to make the text wrap into two lines if needed
                .minimumScaleFactor(0.5) // Adjust the minimum scale factor to reduce the font size
            
            Image(systemName: "play.circle.fill")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 44, height: 44)
                .padding(10)
                .onTapGesture {
                    playAudio()
                }
        }
        .foregroundColor(.white)
        .padding(30)
        .frame(width: 160, height: 200)
        .background(.linearGradient(colors: [musicSection.color.opacity(1), musicSection.color.opacity(0.5)], startPoint: .topLeading, endPoint: .bottomTrailing))
        
        .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
        .shadow(color: musicSection.color.opacity(0.3), radius: 8, x: 0, y: 12)
        .shadow(color: musicSection.color.opacity(0.3), radius: 2, x: 0, y: 1)
    }
    
    func playAudio() {
        guard let audioURL = Bundle.main.url(forResource: musicSection.audio, withExtension: "mp3") else {
            return
        }
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: audioURL)
            audioPlayer?.play()
        } catch {
            print("Failed to play audio: \(error.localizedDescription)")
        }
    }
}

struct MusicSectionCard_Previews: PreviewProvider {
    static var previews: some View {
        MusicSectionCard(musicSection: sections[1])
            .previewLayout(.sizeThatFits)
    }
}
