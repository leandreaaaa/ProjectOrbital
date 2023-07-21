//
//  ProfileView.swift
//  Project
//
//  Created by Leandrea De Conceicao on 9/7/23.
//

import SwiftUI
import RiveRuntime

struct ProfileView: View {
    let button = RiveViewModel(fileName: "button", autoPlay: false)
    @State private var showModal = false
    @Binding var show: Bool
    @State private var selectedCharacter: String = "girl1"
    

    let characters = ["girl2", "girl1", "boy1", "girl3", "girl4", "girl5", "boy2", "girl6"]

    var body: some View {
        ZStack {
            Color("Shadow").ignoresSafeArea()
                .opacity(showModal ? 0.4 : 0)

            VStack(spacing: 20) {
                ProfileHeader(character: selectedCharacter)

                Divider()

                CharacterSelectionView(selectedCharacter: $selectedCharacter, characters: characters)

                
                .padding(.bottom, 20)
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

            if showModal {
                SignInView(show: $showModal)
                    .opacity(showModal ? 1 : 0)
                    .offset(y: showModal ? 0 : 300)
                    .overlay(
                        Button {
                            withAnimation(.spring()) {
                                showModal.toggle()
                            }
                        } label: {
                            Image(systemName: "xmark")
                                .frame(width: 36, height: 36)
                                .foregroundColor(.black)
                                .background(.white)
                                .clipShape(Circle())
                                .shadow(color: Color("Shadow").opacity(0.3), radius: 5, x: 0, y: 3)
                        }
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
                        .offset(y: showModal ? 0 : 200)
                    )
                    .transition(.opacity.combined(with: .move(edge: .top)))
                    .zIndex(1)
            }

            Button {
                withAnimation {
                    show.toggle()
                }
            } label: {
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
    }
}

struct ProfileHeader: View {
    var character: String
    @State private var showEditProfile = false

    var body: some View {
        VStack(spacing: 20) {
            Text("Profile")
                .font(.custom("Poppins Bold", size: 40))
                .frame(width: 260)
                .multilineTextAlignment(.leading)

            ZStack {
                Circle()
                    .frame(width: 150, height: 150)
                    .foregroundColor(.white)
                    .shadow(radius: 10)

                Image(character)
                    .resizable()
                    .frame(width: 130, height: 130)
                    .clipShape(Circle())
            }

            Text("Leandrea")
                .font(.title)
                .fontWeight(.bold)

            Button(action: {
                showEditProfile = true
            }) {
                Text("Edit Profile")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.black)
                    .cornerRadius(10)
            }
            .sheet(isPresented: $showEditProfile) {
                EditProfileView()
            }
            
        }
        .padding(10)
    }
}

struct CharacterSelectionView: View {
    @Binding var selectedCharacter: String
    let characters: [String]

    var body: some View {
        VStack {
            Text("Choose your character!")
                .fontWeight(.bold)
                .font(.system(size: 25)) // Set the font size to 35

            ScrollViewReader { scrollViewProxy in
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 20) {
                        ForEach(characters, id: \.self) { character in
                            CharacterSelectionButton(character: character, isSelected: character == selectedCharacter) {
                                selectedCharacter = character
                                scrollToCharacter(character, scrollViewProxy)
                            }
                        }
                    }
                    .padding(.horizontal, 20)
                }
            }
        }
        .padding()
    }

    private func scrollToCharacter(_ character: String, _ scrollViewProxy: ScrollViewProxy) {
        withAnimation {
            scrollViewProxy.scrollTo(character, anchor: .center)
        }
    }
}

struct CharacterSelectionButton: View {
    var character: String
    var isSelected: Bool
    var onTap: () -> Void

    var body: some View {
        Image(character)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 80, height: 80)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.blue, lineWidth: isSelected ? 4 : 0)
            )
            .padding(4)
            .onTapGesture {
                onTap()
            }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(show: .constant(true))
    }
}
