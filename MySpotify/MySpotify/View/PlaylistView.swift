//
//  PlaylistView.swift
//  MySpotify
//
//  Created by Kanika.Sharma on 09/12/24.
//

import SwiftUI

struct PlaylistView: View {
    
    @ObservedObject var libraryViewModel: LibraryViewModel
    @State var playlist: Playlist
    @State private var showTrackSearch = false
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color.purple, Color.black, Color.black, Color.black]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            
            VStack(alignment: .leading, spacing: 20) {
                HStack {
                    Spacer()
                    
                    Button(action: {
                        showTrackSearch = true
                    }) {
                        Image(systemName: "plus")
                            .foregroundColor(.white)
                            .font(.title2)
                    }
                }
                .padding(.horizontal)
                VStack(alignment: .leading, spacing: 4) {
                    Text(playlist.name)
                        .font(.largeTitle)
                        .bold()
                        .foregroundColor(.white)
                    
                    Text("\(playlist.tracks.count) song\(playlist.tracks.count == 1 ? "" : "s")")
                        .font(.subheadline)
                        .foregroundColor(.white.opacity(0.7))
                }
                .padding(.horizontal)
                
                Spacer()
                
                if playlist.tracks.isEmpty {
                    Text("No tracks in this playlist")
                        .foregroundColor(.gray)
                        .padding()
                } else {
                    ScrollView {
                        VStack(alignment: .leading, spacing: 8) {
                            ForEach(playlist.tracks, id: \.self) { track in
                                Text(track.trackName)
                                    .foregroundColor(.white)
                                    .padding()
                                    .background(Color.gray.opacity(0.2))
                                    .cornerRadius(10)
                                    .padding(.horizontal)
                                    .multilineTextAlignment(.leading)
                            }
                        }
                    }
                }
                
                Spacer()
            }
            if showTrackSearch {
                TrackSearchView(isPresented: $showTrackSearch, playlist: $playlist, libraryViewModel: libraryViewModel)
            } // Add search view
        }
        
    }
}


#Preview {
    PlaylistView(libraryViewModel: LibraryViewModel(), playlist: Playlist(id: UUID(), name: "Playlist", tracks: [], thumbnail: ""))
}
