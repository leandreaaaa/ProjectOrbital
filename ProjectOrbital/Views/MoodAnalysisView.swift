//
//  MoodAnalysisView.swift
//  Project
//
//  Created by Leandrea De Conceicao on 14/7/23.
//

import SwiftUI
import SwiftUICharts
import RiveRuntime

struct MoodAnalysisView: View {
    @State private var moodData: [MoodEntry] = [
        MoodEntry(date: Date(), mood: .happy),
        MoodEntry(date: Date().addingTimeInterval(-86400), mood: .sad),
        MoodEntry(date: Date().addingTimeInterval(-2 * 86400), mood: .neutral),
        // Add more mood entries here...
    ]
    
    var body: some View {
        VStack(spacing: 16) {
            Text("Mood Analysis")
                .fontWeight(.bold)
                .font(.custom("Poppins Bold", size: 34))
                .frame(width: 260)
                .multilineTextAlignment(.center)
            
            if moodData.isEmpty {
                Text("No mood entries found.")
                    .foregroundColor(.gray)
            } else {
                LineChartView(data: moodData.map { Double($0.mood.rawValue) },
                              title: "Mood",
                              legend: "Mood Levels",
                              style: ChartStyle(backgroundColor: Color.white,
                                                 accentColor: Color(red: 0.05, green: 0.5, blue: 0.9),
                                                 gradientColor: GradientColor(start: Color(red: 0.1, green: 0.6, blue: 1.0),
                                                                             end: Color(red: 0.5, green: 0.8, blue: 1.0)),
                                                 textColor: Color.black,
                                                 legendTextColor: Color.black,
                                                 dropShadowColor: Color.black),
                              valueSpecifier: "%.0f")
                    .padding()
            }
            
            MoodCalendarView(moodData: moodData)
        }
    }
}

struct MoodCalendarView: View {
    var moodData: [MoodEntry]
    
    @State private var displayedMonthIndex = 0
    
    private let calendar: Calendar = Calendar.current
    
    private let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEE"
        return formatter
    }()
    
    var body: some View {
        VStack {
            
            HStack {
                Button(action: {
                    navigateToPreviousMonth()
                }) {
                    Image(systemName: "chevron.left")
                }
                .padding(.horizontal)
                
                Text(displayedMonthName())
                    .font(.headline)
                    .padding(.vertical, 8)
                
                Button(action: {
                    navigateToNextMonth()
                }) {
                    Image(systemName: "chevron.right")
                }
                .padding(.horizontal)
            }
            
            GeometryReader { geometry in
                VStack(spacing: 0) {
                    LazyHGrid(rows: [GridItem(.flexible())], spacing: 0) {
                        ForEach(0..<7, id: \.self) { index in
                            Text(dayName(for: index))
                                .font(.subheadline)
                                .frame(maxWidth: .infinity)
                        }
                    }
                    .frame(height: 24)
                    
                    Divider()
                        .background(Color.black)
                        .padding(.vertical, 4)
                    
                    LazyVGrid(columns: Array(repeating: GridItem(), count: 7), spacing: 0) {
                        ForEach(daysInMonth(), id: \.self) { day in
                            let moodEntry = moodData.first { calendar.isDate(day, inSameDayAs: $0.date) }
                            MoodCalendarDayView(day: day, moodEntry: moodEntry)
                                .frame(height: geometry.size.width / 7) // Use a fixed height for each row
                        }
                    }
                }
            }
            .padding(40)
            .padding(.top, 40)
            .background(
                RiveViewModel(fileName: "shapes").view()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .ignoresSafeArea()
                    .blur(radius: 30)
                    .blendMode(.hardLight)
            )
            .background(
                Image("Spline")
                    .blur(radius: 50)
                    .offset(x: 200, y: 100)
            )
        }
    }
    
    private func displayedMonthName() -> String {
        let displayedMonth = monthsInYear()[displayedMonthIndex]
        return displayedMonth.monthName()
    }
    
    private func navigateToPreviousMonth() {
        if displayedMonthIndex > 0 {
            displayedMonthIndex -= 1
        }
    }
    
    private func navigateToNextMonth() {
        if displayedMonthIndex < monthsInYear().count - 1 {
            displayedMonthIndex += 1
        }
    }
    
    private func monthsInYear() -> [Date] {
        let startOfMonth = calendar.date(from: calendar.dateComponents([.year], from: Date()))!
        var months: [Date] = []
        
        for i in 0..<12 {
            let month = calendar.date(byAdding: .month, value: i, to: startOfMonth)!
            months.append(month)
        }
        
        return months
    }
    
    private func daysInMonth() -> [Date] {
        let displayedMonth = monthsInYear()[displayedMonthIndex]
        let range = calendar.range(of: .day, in: .month, for: displayedMonth)!
        let days = range.lowerBound..<range.upperBound
        let daysInMonth = days.compactMap { calendar.date(byAdding: .day, value: $0, to: displayedMonth) }
        
        return daysInMonth
    }
    
    private func dayName(for index: Int) -> String {
        let weekdaySymbols = calendar.shortWeekdaySymbols
        let weekdayIndex = (index + calendar.firstWeekday - 1) % 7
        return weekdaySymbols[weekdayIndex]
    }
}

struct MoodCalendarDayView: View {
    var day: Date
    var moodEntry: MoodEntry?
    var calendar: Calendar = .current
    
    var body: some View {
        VStack(spacing: 0) {
            Text(String(calendar.component(.day, from: day)))
                .font(.system(size: 18))
                .padding(.vertical, 4)
            
            if let moodEntry = moodEntry {
                Spacer(minLength: 0) // Add spacer to push the image to the bottom
                Image(systemName: moodEntry.mood.iconName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 24, height: 24)
                    .foregroundColor(moodEntry.mood.color)
            } else {
                Color.clear
            }
        }
        .padding(.vertical, 0)
    }
}


struct MoodEntry: Identifiable {
    let id = UUID()
    let date: Date
    let mood: Mood
    
    // You can add more properties to MoodEntry if needed, such as notes or additional data.
}

enum Mood: Int {
    case happy = 3
    case sad = 1
    case neutral = 2
    
    var iconName: String {
        switch self {
        case .happy:
            return "smiley.fill"
        case .sad:
            return "tears.fill"
        case .neutral:
            return "meh.fill"
        }
    }
    
    var color: Color {
        switch self {
        case .happy:
            return .green
        case .sad:
            return .red
        case .neutral:
            return .yellow
        }
    }
}

extension Date {
    func monthName() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM"
        return dateFormatter.string(from: self)
    }
}

struct MoodAnalysisView_Previews: PreviewProvider {
    static var previews: some View {
        MoodAnalysisView()
    }
}
