//
//  FeedView.swift
//  Threads
//
//  Created by Shivansh Mahajan on 08/04/24.
//

import SwiftUI

struct FeedView: View {
    var body: some View {
        NavigationStack{
            ScrollView(showsIndicators:false){
                LazyVStack{
                    ForEach(0...10,id:\.self){  thread in
                        ThreadCell()
                    }
                }
            }
                .refreshable {
                    print("DEBUG:Refresh threads")
                }
                .navigationTitle("Threads")
                .navigationBarTitleDisplayMode(.inline)
            }
            
            .toolbar{
                ToolbarItem(placement: .navigationBarTrailing){
                    Button{
                        
                    }label:{
                        Image(systemName: "arrow.counterclockwise")
                            .foregroundColor(.black)
                    }
                }
            }
    }
}

struct FeedView_Previews: PreviewProvider {
        static var previews: some View {
            NavigationStack{
                FeedView()
            }
        }
}

