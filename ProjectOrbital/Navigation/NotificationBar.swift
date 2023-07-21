//
//  NotificationBar.swift
//  Project
//
//  Created by Leandrea De Conceicao on 14/7/23.
//

import SwiftUI
import UserNotifications

struct NotificationBar: View {
    var message: String

    var body: some View {
        VStack {
            Spacer()
            
            HStack {
                Image(systemName: "heart")
                    .foregroundColor(.black)
                    .font(.title)

                Text(message)
                    .foregroundColor(.black)
                    .font(.body)
                    .multilineTextAlignment(.leading)

                Spacer()
            }
            .padding()
            .background(Color.blue.opacity(0.2))
            .cornerRadius(10)
            .padding(.horizontal)
        }
        .frame(height: 60)
        .padding(.top)
        .edgesIgnoringSafeArea(.top)
    }
}


func scheduleNotification() {
    let center = UNUserNotificationCenter.current()
    
    center.requestAuthorization(options: [.alert, .sound]) { granted, error in
        if granted {
            let content = UNMutableNotificationContent()
            content.title = "Reminder"
            content.body = "Please remember to input your mood in the mood tracker."
            content.sound = .default
            
            let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 1, repeats: false)
            
            let request = UNNotificationRequest(identifier: "dailyReminder", content: content, trigger: trigger)
            
            center.add(request) { error in
                if let error = error {
                    print("Error scheduling notification: \(error.localizedDescription)")
                } else {
                    print("Notification scheduled")
                }
            }
        } else {
            print("Notification permission denied")
        }
    }
}

struct NotificationBar_Previews: PreviewProvider {
    static var previews: some View {
        NotificationBar(message: "How are you feeling today?")
    }
}


