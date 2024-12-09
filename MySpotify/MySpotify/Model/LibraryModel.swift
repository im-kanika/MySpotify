//
//  LibraryModel.swift
//  MySpotify
//
//  Created by Kanika.Sharma on 08/12/24.
//

import Foundation

struct Playlist: Identifiable, Codable, Hashable {
    let id: UUID
    let name: String
    var tracks: [Track]
    var thumbnail: String // Placeholder for image
}

struct Track: Identifiable, Codable, Hashable {
    let id: Int
    let trackName: String
    let artistName: String
    let type: String
    
    enum CodingKeys: String, CodingKey {
        case id = "trackId"
        case trackName = "trackName"
        case artistName = "artistName"
        case type = "kind"
        
    }
}
