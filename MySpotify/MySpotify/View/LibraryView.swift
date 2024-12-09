//
//  LibraryView.swift
//  MySpotify
//
//  Created by Kanika.Sharma on 08/12/24.
//

import SwiftUI

struct LibraryView: View {
    
    @StateObject private var viewModel = LibraryViewModel()
    @State private var showExpandedSheet = false
    @State private var showAddPlaylistSheet = false
    @State private var playlists: [Playlist] = []
    @State var navigateToPlaylist: Bool = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                VStack {
                    HStack {
                        Image(systemName: "person.circle")
                            .resizable()
                            .frame(width: 40, height: 40)
                            .foregroundColor(.white)
                        Text("Your Library")
                            .font(.largeTitle)
                            .bold()
                        
                        Spacer()
                        
                        Button(action: {
                            showAddPlaylistSheet = true
                        }) {
                            Image(systemName: "plus")
                                .font(.title2)
                        }
                    }
                    .padding()
                    
                    HStack {
                        Text("Playlists")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding(.horizontal)
                            .padding(.vertical, 6)
                            .background(RoundedRectangle(cornerRadius: 12).stroke(Color.white, lineWidth: 1))
                        Spacer()
                    }.padding()
                    
                    
                    HStack {
                        Spacer()
                        
                        Button(action: {
                            viewModel.isGridView.toggle()
                        }) {
                            Image(systemName: viewModel.isGridView ? "list.bullet" : "square.grid.2x2")
                                .font(.title2)
                                .foregroundColor(.white)
                        }
                    }
                    .padding()
                    
                    if viewModel.isGridView {
                        GridView(libraryViewModel: viewModel)
                    } else {
                        TableView(libraryViewModel: viewModel)
                    }
                }
                .background(Color.black.ignoresSafeArea(edges: .all))
                .navigationTitle("")
                .navigationBarHidden(true)
                
                if showAddPlaylistSheet {
                    AddPlaylistBottomView(isPresented: $showAddPlaylistSheet, showExpandedSheet: $showExpandedSheet, libraryViewModel: viewModel)
                    
                }
                
                if showExpandedSheet {
                    AddPlaylistExpandedView(showExpandedSheet: $showExpandedSheet, navigateToPlaylist: $navigateToPlaylist, libraryViewModel: viewModel)
                }
            }
            .navigationDestination(isPresented: $navigateToPlaylist) {
                PlaylistView(libraryViewModel: viewModel, playlist: viewModel.playlists.last ?? Playlist(id: UUID(), name: "", tracks: [], thumbnail: ""))
            }
        }
        .onAppear {
            viewModel.loadPlaylists()
        }
        .foregroundStyle(Color.white)
        
    }
}

#Preview {
    LibraryView()
}
