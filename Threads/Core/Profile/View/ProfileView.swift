//
//  ProfileView.swift
//  Threads
//
//  Created by Shivansh Mahajan on 09/04/24.
//

import SwiftUI

struct ProfileView: View {
    @State private var selectedFilter:ProfileThreadFilter = .threads
    @Namespace var animation
    
    private var filterBarWidth: CGFloat {
        let count = CGFloat(ProfileThreadFilter.allCases.count)
        return UIScreen.main.bounds.width / count - 16
    }

    
    var body: some View {
        NavigationStack{
            ScrollView(showsIndicators: false) { // Fixed the typo in "showsIndicators"
                VStack(spacing:20) {
                    HStack (alignment:.top){
                        VStack(alignment: .leading, spacing: 12) {
                            VStack(alignment: .leading, spacing: 4) { // Fixed the typo in "alignment"
                                Text("Shivansh")
                                    .font(.title2)
                                    .fontWeight(.semibold)
                                Text("Shivansh mahajan")
                                    .font(.subheadline)
                            }
                            Text("DataScientist of JUET")
                                .font(.footnote)
                            Text("2 followers")
                                .font(.caption)
                                .foregroundColor(.gray)
                        }
                        Spacer()
                        CircularProfileImageView()
                    }
                    Button{
                        
                    }label:{
                        Text("follow")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .frame(width: 352,height: 32)
                            .background(.black)
                            .cornerRadius(8)
                    }
                    
                    VStack{
                        HStack{
                            ForEach(ProfileThreadFilter.allCases){filter in
                                VStack{
                                    Text(filter.title)
                                        .font(.subheadline)
                                        .fontWeight(selectedFilter==filter ? .semibold :.regular)
                                    if selectedFilter==filter{
                                        Rectangle()
                                            .foregroundColor(.black)
                                            .frame(width: 180,height: 1)
                                    }
                                    else{
                                        Rectangle()
                                            .foregroundColor(.clear)
                                            .frame(width: filterBarWidth,height: 1)
                                            .matchedGeometryEffect(id: "item", in: animation)
                                    }
                                }
                                .onTapGesture {
                                    withAnimation(.spring()){
                                        selectedFilter=filter
                                    }
                                }
                            }
                        }
                        LazyVStack{
                            ForEach(0...10,id:\.self){thread in
                                ThreadCell()
                            }
                        }
                    }
                    .padding(.vertical,8)
                }
            }
            
        }
        .toolbar{
            ToolbarItem(placement:.navigationBarTrailing){
                Button{
                    AuthService.shared.signOut()
                }label:{
                    Image(systemName: "line.3.horizontal")
                }
            }
        }
        .padding(.horizontal)

    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
