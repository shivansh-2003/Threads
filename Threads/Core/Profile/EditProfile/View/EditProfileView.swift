//
//  EditProfileView.swift
//  Threads
//
//  Created by Shivansh Mahajan on 09/04/24.
//

import SwiftUI

struct EditProfileView: View {
    @State private var bio=""
    @State private var link=""
    @State private var isPrivateProfile=false
    var body: some View {
        NavigationView {
            ZStack {
                Color(.systemGroupedBackground)
                    .edgesIgnoringSafeArea([.bottom, .horizontal])
                
                VStack {
                    HStack {
                        VStack(alignment: .leading) {
                            Text("Name")
                                .fontWeight(.semibold)
                            Text("Charles Lesres")
                        }
                        
                        Spacer()
                        
                        CircularProfileImageView()
                    }
                    
                    
                       Divider()
                    
                    VStack(alignment:.leading){
                        Text("Bio")
                            .fontWeight(.semibold)
                        
                        TextField("Enter your bio",text:$bio,axis: .vertical)
                    }
                    
                    Divider()
                    
                    VStack(alignment:.leading){
                        Text("Bio")
                            .fontWeight(.semibold)
                        
                        TextField("Enter your bio",text:$bio,axis: .vertical)
                    }
                    
                    Divider()
                    
                    Toggle("Private profile",isOn:$isPrivateProfile)
                        
                }
                .font(.footnote)
                .padding()
                .background(.white)
                .cornerRadius(10)
                .overlay{
                    RoundedRectangle(cornerRadius:10)
                        .stroke(Color(.systemGray4),lineWidth: 1)
                }
                .padding()
            }
            .navigationTitle("Edit Profile")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        // Action for Cancel button
                    }
                    .font(.subheadline)
                    .foregroundColor(.black)
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Done") {
                        // Action for Done button
                    }
                    .font(.subheadline)
                    .foregroundColor(.black)
                }
            }
        }
    }
}

struct EditProfileView_Previews: PreviewProvider {
    static var previews: some View {
        EditProfileView()
    }
}
