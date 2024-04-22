//
//  CreateThreadsView.swift
//  Threads
//
//  Created by Shivansh Mahajan on 09/04/24.
//

import SwiftUI

struct CreateThreadsView: View {
    @State private var caption = ""
    @Environment(\.dismiss) var dismiss
    var body: some View {
        NavigationView {
            VStack(spacing: 8) {
                HStack(alignment: .top) {
                    CircularProfileImageView()
                    
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Shivansh")
                            .fontWeight(.semibold)
                        TextField("Start a Thread", text: $caption) // Corrected the spelling of TextField
                            .textFieldStyle(RoundedBorderTextFieldStyle()) // Added a border style for the text field
                    }
                    .font(.footnote)
                    
                    Spacer()
                    
                    if !caption.isEmpty{
                        Button{
                            caption=""
                        }label:{
                            Image(systemName: "xmark")
                                .resizable()
                                .frame(width:12 ,height: 12)
                                .foregroundColor(.gray)
                        }
                    }
                }
                Spacer()
            }
            .padding()
            .navigationTitle("New Thread")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                    .font(.subheadline)
                    .foregroundColor(.black)
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Post") {
                        // Action for Post button
                    }
                    .opacity(caption.isEmpty ? 0.5:1.0)
                    .disabled(caption.isEmpty)
                    .font(.subheadline)
                    .foregroundColor(.black)
                    .fontWeight(.semibold)
                }
            }
            .navigationTitle("Create Thread")
        }
    }
}

struct CreateThreadsView_Previews: PreviewProvider {
    static var previews: some View {
        CreateThreadsView()
    }
}
