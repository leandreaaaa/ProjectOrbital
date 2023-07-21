//
//  ActivitiesView.swift
//  Project
//
//  Created by Leandrea De Conceicao on 13/7/23.
//

import SwiftUI

struct MusicView: View {
    var body: some View {
        ZStack {
            Color("Background").ignoresSafeArea()
            
            ScrollView {
                content
            }
        }
    }
    
    var content: some View {
        VStack(alignment: .leading, spacing: 0) {
            VStack(alignment: .center, spacing: 0) {
                Text("Music")
                    .customFont(.largeTitle)
                    .frame(maxWidth: .infinity, alignment: .center)
            }
            .padding(.horizontal, 20)
            
            ScrollView {
                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 20) {
                    ForEach(sections) { section in
                        NavigationLink(destination: ManagingAnxietyView()) {
                            MusicSectionCard(musicSection: section)
                        }
                    }
                }
                .padding(20)
            }
            Spacer()
    
            
            Spacer()
            
            VStack {
                Text("Favourited")
                    .customFont(.title3)
                    .frame(maxWidth: .infinity, alignment: .center)
            }
        }
    }
}


struct MusicView_Previews: PreviewProvider {
    static var previews: some View {
        MusicView()
    }
}
