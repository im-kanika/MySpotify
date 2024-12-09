//
//  GridView.swift
//  MySpotify
//
//  Created by Kanika.Sharma on 08/12/24.
//

import SwiftUI

struct GridView: View {
    
    @ObservedObject var libraryViewModel: LibraryViewModel
    
    var body: some View {
        ScrollView {
                    LazyVGrid(columns: [GridItem(), GridItem()]) {
                        ForEach(libraryViewModel.playlists) { playlist in
                            NavigationLink(destination: PlaylistView(libraryViewModel: libraryViewModel, playlist: playlist)) {
                                VStack {
                                    Image(systemName: "music.note.list") // Placeholder for playlist image
                                        .resizable()
                                        .scaledToFit()
                                        .frame(height: 100)
                                        .background(Color.gray.opacity(0.2))
                                        .cornerRadius(8)
                                    
                                    Text(playlist.name)
                                        .font(.headline)
                                    
                                    Text("\(playlist.tracks.count) songs")
                                        .font(.subheadline)
                                        .foregroundColor(.gray)
                                }
                            }
                        }
                    }
                    .padding()
                }
        .background(Color.black)
        .foregroundStyle(Color.white)
    }
}

#Preview {
    GridView(libraryViewModel: LibraryViewModel())
}
