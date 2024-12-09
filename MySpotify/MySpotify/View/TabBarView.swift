//
//  TabBarView.swift
//  MySpotify
//
//  Created by Kanika.Sharma on 08/12/24.
//

import SwiftUI

struct TabBarView: View {
    var body: some View {
        TabView {
                    Text("Home")
                        .tabItem {
                            Label("Home", systemImage: "house")
                        }
                    SearchView()
                        .tabItem {
                            Label("Search", systemImage: "magnifyingglass")
                        }
                    LibraryView()
                        .tabItem {
                            Label("Your Library", systemImage: "music.note.list")
                        }
                }
    }
}

#Preview {
    TabBarView()
}
