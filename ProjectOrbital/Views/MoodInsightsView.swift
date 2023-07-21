import SwiftUI

struct Bar: Identifiable {
    let id = UUID()
    var name: String
    var day: String
    var value: Double
    var color: Color
    
    static var sampleBars: [Bar] {
        var tempBars = [Bar]()
        let days = ["😄", "😊", "😐", "😔", "😠", "🤬"]
        let values = [5.0, 3.0, 2.0, 1.0, 1.0, 1.0]
        let colors: [Color] = [.green, .yellow, .gray, .blue, .orange, .red]
        
        for i in 0..<6 {
            let bar = Bar(name: "\(i)", day: days[i], value: values[i], color: colors[i])
            tempBars.append(bar)
        }
        return tempBars
    }
    
    static func scaleBars(bars: [Bar]) -> [Bar] {
        guard let minValue = bars.map({ $0.value }).min(),
              let maxValue = bars.map({ $0.value }).max() else {
            return bars
        }
        
        return bars.map { bar in
            let scaledValue = (bar.value - minValue) / (maxValue - minValue)
            return Bar(name: bar.name, day: bar.day, value: scaledValue, color: bar.color)
        }
    }
}

struct MoodInsightsView: View {
    @State private var bars = Bar.scaleBars(bars: Bar.sampleBars)
    @State private var selectedID: UUID = UUID()
    @State private var text = "Info"
    
    var body: some View {
        VStack {
            Text("Mood Insights")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.top, 30)
            
            Text(text)
                .bold()
                .padding()
            
            HStack(alignment: .bottom) {
                ForEach(bars) { bar in
                    VStack {
                        ZStack {
                            Rectangle()
                                .foregroundColor(bar.color)
                                .frame(width: 35, height: bar.value * 200, alignment: .bottom)
                                .opacity(selectedID == bar.id ? 0.5 : 1.0)
                                .cornerRadius(6)
                                .onTapGesture {
                                    self.selectedID = bar.id
                                    self.text = "Value: \(Int(bar.value * 100))"
                                }
                            Text("\(Int(bar.value * 100))")
                                .foregroundColor(.white)
                        }
                        Text(bar.day)
                    }
                    
                }
            }
            .frame(height: 240, alignment: .bottom)
            .padding(20)
            .background(.thinMaterial)
            .cornerRadius(6)
        }
    }
}

struct MoodInsightsView_Previews: PreviewProvider {
    static var previews: some View {
        MoodInsightsView()
    }
}
