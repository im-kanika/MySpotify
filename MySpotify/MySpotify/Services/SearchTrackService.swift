//
//  SearchTrackService.swift
//  MySpotify
//
//  Created by Kanika.Sharma on 09/12/24.
//

import Foundation

class TrackSearchAPI {
    // API URL for iTunes search
    private let apiURL = "https://itunes.apple.com/search?term="
    
    // Method to fetch search results
    func searchTracks(query: String, completion: @escaping ([Track]) -> Void) {
        guard !query.isEmpty else {
            completion([])
            return
        }
        
        // Create the full API request URL with the search term
        let urlString = apiURL + query + "&media=music&entity=song"
        
        guard let url = URL(string: urlString) else {
            completion([])
            return
        }
        
        // Perform network request to fetch search results
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data, error == nil {
                do {
                    let decodedData = try JSONDecoder().decode(SearchResponse.self, from: data)
                    DispatchQueue.main.async {
                        // Return the track names
                        completion(decodedData.results.map { $0 })
                    }
                } catch {
                    print("Error decoding data: \(error)")
                    DispatchQueue.main.async {
                        completion([])
                    }
                }
            } else {
                DispatchQueue.main.async {
                    completion([])
                }
            }
        }.resume()
    }
}

