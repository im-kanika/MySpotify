//
//  AddPlaylistExpandedView.swift
//  MySpotify
//
//  Created by Kanika.Sharma on 09/12/24.
//

import SwiftUI

struct AddPlaylistExpandedView: View {
    
    @Binding var showExpandedSheet: Bool
    @Binding var navigateToPlaylist: Bool
    @State private var playlistName: String = ""
    @StateObject var libraryViewModel: LibraryViewModel
    
    var body: some View {
        // NavigationStack {
        ZStack(alignment: .center) {
            Color.black.edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 30) {
                Text("Name your playlist.")
                    .font(.title2)
                    .foregroundColor(.white)
                
                TextField("Enter playlist name", text: $playlistName)
                    .padding(.vertical, 8)
                    .overlay(Rectangle().frame(height: 1).padding(.top, 35).foregroundColor(.white))
                    .foregroundColor(.white)
                
                Button(action: {
                    if !playlistName.isEmpty {
                        // Create and add the new playlist to the view model
                        libraryViewModel.addPlaylist(name: playlistName)
                        navigateToPlaylist = true
                        showExpandedSheet = false
                    }
                }) {
                    Text("Confirm")
                        .frame(width: 150, height: 40)
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(20)
                }
            }
            .padding()
            .background(Color.black)
            .cornerRadius(16)
        }
        .onTapGesture {
            showExpandedSheet = false
        }
    }
}

#Preview {
    AddPlaylistExpandedView(showExpandedSheet: .constant(true), navigateToPlaylist: .constant(false), libraryViewModel: LibraryViewModel())
}
