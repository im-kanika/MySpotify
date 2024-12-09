//
//  TableView.swift
//  MySpotify
//
//  Created by Kanika.Sharma on 08/12/24.
//

import SwiftUI

struct TableView: View {
    
    @ObservedObject var libraryViewModel: LibraryViewModel
    
    var body: some View {
        List(libraryViewModel.playlists) { playlist in
            NavigationLink(destination: PlaylistView(libraryViewModel: libraryViewModel, playlist: playlist)) {
                HStack {
                    Image(systemName: "music.note.list") // Placeholder for playlist image
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50, height: 50)
                        .cornerRadius(8)
                    
                    VStack(alignment: .leading) {
                        Text(playlist.name)
                            .font(.headline)
                        
                        Text("\(playlist.tracks.count) songs")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                }
            } .listRowBackground(Color.black)
        } .background(Color.black)
        .foregroundStyle(Color.white)
        .scrollContentBackground(.hidden)
        
    }
}

#Preview {
    TableView(libraryViewModel: LibraryViewModel())
}
