//
//  LibraryViewModel.swift
//  MySpotify
//
//  Created by Kanika.Sharma on 08/12/24.
//

import Foundation
import Combine

class LibraryViewModel: ObservableObject {
    @Published var playlists: [Playlist] = []
    @Published var isGridView: Bool = false
    private let storageKey = "playlists"
    
    init() {
        loadPlaylists()
    }
    
    func addPlaylist(name: String) {
        let newPlaylist = Playlist(id: UUID(), name: name, tracks: [], thumbnail: "placeholder")
        playlists.append(newPlaylist)
        savePlaylists()
    }
    
    func addTrack(to playlistID: UUID, track: Track) {
        if let index = playlists.firstIndex(where: { $0.id == playlistID }) {
            playlists[index].tracks.append(track)
            savePlaylists()
        }
    }
    
    private func savePlaylists() {
        if let encodedData = try? JSONEncoder().encode(playlists) {
            UserDefaults.standard.set(encodedData, forKey: storageKey)
        }
    }
    
    func loadPlaylists() {
        if let data = UserDefaults.standard.data(forKey: storageKey),
           let decodedPlaylists = try? JSONDecoder().decode([Playlist].self, from: data) {
            playlists = decodedPlaylists
        }
    }
    
}
