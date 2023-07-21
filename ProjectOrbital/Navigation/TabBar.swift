//
//  TabBar.swift
//  Project
//
//  Created by Leandrea De Conceicao on 8/7/23.
//

import SwiftUI
import RiveRuntime

struct TabBar: View {
    @AppStorage("selectedTab") var selectedTab: Tab = .activity

    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                HStack {
                    content
                }
                .frame(maxWidth: .infinity)
                .padding(12)
                .background(Color("Background 2").opacity(0.8))
                .background(.ultraThinMaterial)
                .mask(RoundedRectangle(cornerRadius: 26, style: .continuous))
                .shadow(color: Color("Background 2").opacity(0.3), radius: 20, x: 0, y: 20)
                .overlay(
                    RoundedRectangle(cornerRadius: 26, style: .continuous)
                        .stroke(.linearGradient(colors: [.white.opacity(0.5), .white.opacity(0)], startPoint: .topLeading, endPoint: .bottomTrailing))
                )
                .padding(.horizontal, 24)
            }
        }
    }

    var content: some View {
        ForEach(tabItems) { item in
            if item.tab == .user {
                NavigationLink(
                    destination: ProfileView(show: .constant(false)),
                    label: {
                        item.icon
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 36, height: 36)
                            .frame(maxWidth: .infinity)
                            .opacity(selectedTab == item.tab ? 1 : 0.5)
                            .background(
                                VStack {
                                    RoundedRectangle(cornerRadius: 2)
                                        .frame(width: selectedTab == item.tab ? 20 : 0, height: 4)
                                        .offset(y: -4)
                                        .opacity(selectedTab == item.tab ? 1 : 0)
                                    Spacer()
                                }
                            )
                    }
                )

            } else {
                Button(action: {
                    withAnimation {
                        selectedTab = item.tab
                    }
                }) {
                    item.icon
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 36, height: 36)
                        .frame(maxWidth: .infinity)
                        .opacity(selectedTab == item.tab ? 1 : 0.5)
                        .background(
                            VStack {
                                RoundedRectangle(cornerRadius: 2)
                                    .frame(width: selectedTab == item.tab ? 20 : 0, height: 4)
                                    .offset(y: -4)
                                    .opacity(selectedTab == item.tab ? 1 : 0)
                                Spacer()
                            }
                        )
                }
            }
        }
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
    }
}

struct TabItem: Identifiable {
    var id = UUID()
    var icon: Image
    var tab: Tab
}

var tabItems = [
    TabItem(icon: Image("homelogo"), tab: .activity),
    TabItem(icon: Image("musiclogo"), tab: .music),
    TabItem(icon: Image("heartshapelogo"), tab: .mood),
    TabItem(icon: Image("writelogo"), tab: .journalling),
    TabItem(icon: Image("userlogo"), tab: .user)
]

enum Tab: String {
    case activity
    case music
    case mood
    case journalling
    case user
}
