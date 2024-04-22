//
//  ExploreView.swift
//  Threads
//
//  Created by Shivansh Mahajan on 08/04/24.
//

import SwiftUI

struct ExploreView: View {
    @State private var searchText=""
    var body: some View {
        NavigationStack(){
            ScrollView{
                LazyVStack{
                    ForEach(0...10,id:\.self){ user in
                        VStack {
                            UserCell()
                            Divider()
                        }
                        .padding(.vertical,4)
                    }
                }
            }
            .navigationTitle("Search")
            .searchable(text:$searchText,prompt:"search")
        }
    }
}





struct ExploreView_Previews: PreviewProvider {
        static var previews: some View {
                ExploreView()
        }
}

