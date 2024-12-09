//
//  AddPlaylistBottomView.swift
//  MySpotify
//
//  Created by Kanika.Sharma on 08/12/24.
//

import SwiftUI

struct AddPlaylistBottomView: View {
    
    @Binding var isPresented: Bool
    @Binding var showExpandedSheet: Bool
    @StateObject var libraryViewModel: LibraryViewModel
    
    
    var body: some View {
        ZStack {
            // Background overlay
            Button(action: {
                isPresented = false
            }) {
                Color.black.opacity(0.5)
                    .edgesIgnoringSafeArea(.all)
            }
            .zIndex(0)
            // Bottom sheet content
            VStack {
                Spacer()
                
                VStack(spacing: 16) {
                    Button(action: {
                        isPresented = false
                        showExpandedSheet = true
                    }) {
                        HStack {
                            Image(systemName: "music.note.list")
                                .resizable()
                                .frame(width: 24, height: 24)
                                .foregroundColor(.white)
                            
                            VStack(alignment: .leading) {
                                Text("Playlist")
                                    .font(.headline)
                                    .foregroundColor(.white)
                                
                                Text("Create a playlist with a song")
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                            }
                            Spacer()
                        }
                        .padding()
                        .background(Color.black.opacity(0.7))
                        .cornerRadius(10)
                    }
                }
            }
            .zIndex(1)
        }
        
    }
    
}

#Preview {
    AddPlaylistBottomView(isPresented: .constant(true), showExpandedSheet: .constant(false), libraryViewModel: LibraryViewModel())
}
