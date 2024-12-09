//
//  TrackSearchView.swift
//  MySpotify
//
//  Created by Kanika.Sharma on 09/12/24.
//

import SwiftUI

struct TrackSearchView: View {
    
    @Binding var isPresented: Bool
    @State private var searchQuery = ""
    @State private var searchResults: [Track] = []
    @Binding var playlist: Playlist
    @ObservedObject var libraryViewModel: LibraryViewModel
    
    private let trackSearchAPI = TrackSearchAPI()
    
    var body: some View {
        VStack {
            HStack {
                TextField("Search for tracks", text: $searchQuery)
                    .padding(10)
                    .background(Color.gray.opacity(0.8))
                    .foregroundColor(.white)
                    .cornerRadius(20)
                    .onChange(of: searchQuery) { newValue in
                        fetchSearchResults(query: newValue)
                    }
                    .padding()
                
                Button(action: {
                    isPresented = false
                }) {
                    Text("Cancel")
                        .foregroundColor(.white)
                        .padding(.trailing)
                }
            }
            List(searchResults, id: \.self) { track in
                Button(action: {
                    addTrackToPlaylist(track: track)
                }) {
                    Text(track.trackName)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(10)
                }
                .listRowBackground(Color.black)
            }
            .scrollContentBackground(.hidden) // Ensures the list background is black
            .background(Color.black)
        }
        .background(Color.black.edgesIgnoringSafeArea(.all))
    }
    private func fetchSearchResults(query: String) {
        // Fetch tracks from the API
        trackSearchAPI.searchTracks(query: query) { results in
            searchResults = results
            print(searchResults)
        }
    }
    
    private func addTrackToPlaylist(track: Track) {
        playlist.tracks.append(track) // Add the track to the playlist
        libraryViewModel.addTrack(to: playlist.id, track: track)
        isPresented = false // Dismiss the search view
    }
}

#Preview {
    TrackSearchView(isPresented: .constant(false), playlist: .constant(Playlist(id: UUID(), name: "Playlist", tracks: [], thumbnail: "")), libraryViewModel: LibraryViewModel())
}
