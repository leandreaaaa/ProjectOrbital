//
//  JournallingHistoryView.swift
//  Project
//
//  Created by Leandrea De Conceicao on 14/7/23.
//

import SwiftUI
import RiveRuntime

struct JournallingHistoryView: View {
    @State private var journalEntries: [JournalEntry] = [
        JournalEntry(date: Date(), entry: "Today was a great day!"),
        JournalEntry(date: Date().addingTimeInterval(-86400), entry: "Feeling a bit tired today."),
        JournalEntry(date: Date().addingTimeInterval(-2 * 86400), entry: "Had a productive day."),
        // Add more journal entries here...
    ]
    
    var body: some View {
        NavigationView {
            VStack(spacing: 5) {
                Text("Journalling History")
                    .fontWeight(.bold)
                    .font(.custom("Poppins Bold", size: 34))
                    .frame(width: 260)
                    .multilineTextAlignment(.center)
                    .padding(20)
                    .padding(.top, 0)
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
                
                List(journalEntries) { entry in
                    VStack(alignment: .leading, spacing: 8) {
                        Text(entry.date.formattedDate())
                            .font(.headline)
                        Text(entry.entry)
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                }
            }
        }
    }
}


struct JournalEntry: Identifiable {
    let id = UUID()
    let date: Date
    let entry: String
}

extension Date {
    func formattedDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        return dateFormatter.string(from: self)
    }
}

struct JournallingHistoryView_Previews: PreviewProvider {
    static var previews: some View {
        JournallingHistoryView()
    }
}
