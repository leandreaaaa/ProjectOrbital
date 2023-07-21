//
//  JournallingView.swift
//  Project
//
//  Created by Leandrea De Conceicao on 9/7/23.
//

import SwiftUI
import RiveRuntime

struct JournallingView: View {
    @State private var journalEntry = ""
    @State private var prompt = "Write about your day..."
    @State private var showModal = false
    @Binding var show: Bool
    @State private var entrySubmitted = false

    let button = RiveViewModel(fileName: "button", autoPlay: false)

    var body: some View {
        ZStack {
            Color("Shadow")
                .ignoresSafeArea()
                .opacity(showModal ? 0.4 : 0)

            content
                .offset(y: showModal ? -50 : 0)

            if showModal {
                SignInView(show: $showModal)
                    .opacity(showModal ? 1 : 0)
                    .offset(y: showModal ? 0 : 300)
                    .overlay {
                        closeButton
                    }
                    .transition(.opacity.combined(with: .move(edge: .top)))
                    .zIndex(1)
            }

            closeButton
        }
    }

    var content: some View {
        VStack(spacing: 16) {
            Text("Journal Entry")
                .font(.custom("Poppins-Bold", size: 35)) // Apply custom font here
                .frame(width: 260)
                .multilineTextAlignment(.center)

            Button(action: generatePrompt) {
                Text("Generate Prompt")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.black)
                    .cornerRadius(10)
            }

            TextView(text: $journalEntry, prompt: prompt)
                .frame(height: 400)
                .padding()

            button.view()
                .frame(width: 236, height: 64)
                .background(
                    Color.black
                        .cornerRadius(30)
                        .blur(radius: 10)
                        .opacity(0.3)
                        .offset(y: 10)
                )
                .overlay(
                    Label("Submit", systemImage: "arrow.forward")
                        .offset(x: 4, y: 4)
                        .font(.custom("Poppins-Bold", size: 18)) // Apply custom font here
                        .accentColor(.primary)
                )
                .onTapGesture {
                    try? button.play(animationName: "active")
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
                        withAnimation(.spring()) {
                            showModal.toggle()
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

    var closeButton: some View {
        Button(action: { show.toggle() }) {
            Image(systemName: "xmark")
                .foregroundColor(.white)
                .frame(width: 36, height: 36)
                .background(.black)
                .clipShape(Circle())
                .shadow(color: .black.opacity(0.3), radius: 10, x: 0, y: 10)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
        .padding(20)
        .offset(y: showModal ? -200 : 80)
    }

    func generatePrompt() {
        let prompts = [
            "Write about a recent accomplishment.",
            "Describe something that made you happy today.",
            "What challenges did you face today and how did you overcome them?"
        ]
        prompt = prompts.randomElement() ?? "Write about your day..."
    }
}

struct TextView: View {
    @Binding var text: String
    var prompt: String

    var body: some View {
        ZStack(alignment: .topLeading) {
            if text.isEmpty {
                Text(prompt)
                    .foregroundColor(.black)
                    .padding(.horizontal, 4)
            }

            TextEditor(text: $text)
                .font(.body)
                .background(Color("White"))
                .opacity(0.4)
                .cornerRadius(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color.black.opacity(1), lineWidth: 2)
                )
        }
        .padding(.horizontal, 8)
    }
}

struct JournallingView_Previews: PreviewProvider {
    static var previews: some View {
        JournallingView(show: .constant(true))
    }
}
